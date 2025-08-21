#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/compare_versions.sh <refA> <refB>
# Example: ./scripts/compare_versions.sh v0.2.0 main

REF_A=${1:-v0.2.0}
REF_B=${2:-main}
ROOT="$(cd "$(dirname "$0")/.."; pwd)"
OUTDIR="$ROOT/tmp/bench_compare"
mkdir -p "$OUTDIR"

run_bench() {
  ref="$1"
  out="$OUTDIR/${ref//\//_}"
  mkdir -p "$out"

  echo "=== Running benchmarks for $ref ==="
  # stash uncommitted changes
  git -C "$ROOT" stash push -u -m "bench-temp-$(date +%s)" >/dev/null || true
  # checkout requested ref detached
  git -C "$ROOT" checkout --detach "$ref"

  # ensure gems installed
  if [ -f "$ROOT/Gemfile" ]; then
    bundle install --quiet || bundle install
  fi

  # CPU profile
  bundle exec ruby -r stackprof -e "StackProf.run(mode: :cpu, out: '$out/stackprof.cpu.dump'){ load 'benchmark/performance.rb' }" >"$out/cpu.stdout" 2>"$out/cpu.stderr" || true

  # Object profile
  bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: '$out/stackprof.object.dump'){ load 'benchmark/performance.rb' }" >"$out/object.stdout" 2>"$out/object.stderr" || true

  # Save a short textual stackprof summary
  if command -v stackprof >/dev/null 2>&1; then
    bundle exec stackprof "$out/stackprof.object.dump" --text > "$out/stackprof.object.txt" || true
    bundle exec stackprof "$out/stackprof.cpu.dump" --text > "$out/stackprof.cpu.txt" || true
  fi

  # collect simple timings / summary lines
  grep -E "Route matching:|Path generation:|Memory before:|Routes total:" "$out/cpu.stdout" -n || true
  echo "Saved to $out"

  # restore branch
  git -C "$ROOT" checkout - >/dev/null 2>&1 || true
  git -C "$ROOT" stash pop >/dev/null 2>&1 || true
  echo "=== Done $ref ==="
  echo
}

# run both refs
run_bench "$REF_A"
run_bench "$REF_B"

echo "Comparison data written to $OUTDIR"
echo
echo "To inspect stackprof text reports:"
echo "  less $OUTDIR/<ref>/stackprof.object.txt"
echo
echo "Useful manual commands:"
cat <<'CMD'
# show the Route matching real time lines:
grep -H "Route matching:" tmp/bench_compare/*/cpu.stdout

# show top frames from object-mode stackprof
bundle exec stackprof tmp/bench_compare/<ref>/stackprof.object.dump --text | head -n 80

# compare CPU times quickly
awk '/Route matching:/ {print FILENAME \":\" $0}' tmp/bench_compare/*/cpu.stdout
CMD