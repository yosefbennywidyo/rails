# Performance

## v0.2.0

### Summary of the change

Matching improved from ~9.67s → ~3.56s (≈ 63% faster).
Path generation improved from ~2.30s → ~1.50s (≈ 35% faster).
Memory roughly unchanged.
Why it got faster (concise)

Route matching now uses parameters parsed by the tree instead of reparsing the path on every match: see RubyRoutes::RadixTree#find and RubyRoutes::RouteSet#match. This removed duplicate splitting and allocations.
Lower-allocation path splitting and simple per-path split caching in the tree reduced GC pressure: see radix_tree.rb (#split_path).
Node handler lookup avoids per-call upcasing — fewer String#upcase calls: see RubyRoutes::Node#get_handler.
Path generation became tokenized and cached (precompiled segments + bounded LRU) in RubyRoutes::Route#generate_path and RubyRoutes::Route::SmallLru, reducing gsub/regex and allocations.
Cheap constraint checks were moved into the radix traversal so failing lookups return earlier: see RubyRoutes::RadixTree#find (constraints_match?).

### Suggested next micro‑optimizations

- Tune per-route LRU max size or detect high param diversity and disable caching in that case (already partially implemented in SmallLru). See RubyRoutes::Route::SmallLru.
- If routes have many optional tokens, avoid building large cache keys by using a compact binary/joined key from precomputed token order: see RubyRoutes::Route#cache_key_for.
- Further push trivial constraint checks (numeric, short regex) into traversal when possible to fail earlier (constraints_match? in RubyRoutes::RadixTree#find).
- Reduce temporary string allocations in hot loops (e.g., avoid .split where you can scan indices in very hot paths).
- Re-run CPU + allocation profiles to validate the next changes:
  - CPU: stackprof as you used (see benchmark/performance.rb)
  - Allocations: memory_profiler (add gem and run MemoryProfiler.report around the benchmark).

### Quick profiling command (if you want to re-check after tweaks)

- CPU: bundle exec ruby -r stackprof -e "StackProf.run(mode: :cpu, out: 'tmp/stackprof.dump'){ load 'benchmark/performance.rb' }" && bundle exec stackprof stackprof.dump --text > stackprof.txt
- Allocations: use memory_profiler as described earlier.


### If you want, I can produce a targeted patch to:

- make SmallLru adaptive (disable/resize on thrash) or
- replace the split cache with a tiny hashed cache keyed by path length + first char to reduce memory, or run a focused microbenchmark for a single hot request pattern.


```bash
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        3.349862   0.057571   3.407433 (  3.563653)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       1.394744   0.025189   1.419933 (  1.500029)

Memory usage information:
==================================================
Memory before: 14264 KB
Memory after: 14332 KB
Memory increase: 68 KB
Routes total: 195
```

## v0.1.0

```bash
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        7.940072   0.163104   8.103176 (  9.670957)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       1.775290   0.032248   1.807538 (  2.297000)

Memory usage information:
==================================================
Memory before: 13924 KB
Memory after: 13988 KB
Memory increase: 64 KB
Routes total: 195

Performance test completed!
```
