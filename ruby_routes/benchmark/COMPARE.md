branch alternative:

ruby_routes git:(alternative) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :cpu, out: 'tmp/stackprof.dump'){ load 'benchmark/performance.rb' }"           
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        1.258323   0.022716   1.281039 (  1.301648)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       1.344508   0.026979   1.371487 (  1.393517)

Memory usage information:
==================================================
Memory before: 24940 KB
Memory after: 24948 KB
Memory increase: 8 KB
Routes total: 195

Performance test completed!
➜  ruby_routes git:(alternative) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: 'tmp/stackprof.object.dump') { load 'benchmark/performance.rb' }"
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        5.527790   0.027629   5.555419 (  5.608543)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       5.234886   0.031802   5.266688 (  5.350132)

Memory usage information:
==================================================
Memory before: 24476 KB
Memory after: 24480 KB
Memory increase: 4 KB
Routes total: 195

Performance test completed!
➜  ruby_routes git:(alternative) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: 'tmp/stackprof.object.dump') { load 'benchmark/performance.rb' }"
bundle exec stackprof tmp/stackprof.object.dump --text | head -n 60
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        6.160902   0.055342   6.216244 (  6.346731)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       5.737597   0.052453   5.790050 (  5.881197)

Memory usage information:
==================================================
Memory before: 24304 KB
Memory after: 24308 KB
Memory increase: 4 KB
Routes total: 195

Performance test completed!
==================================
  Mode: object(1)
  Samples: 7963541 (0.00% miss rate)
  GC: 0 (0.00%)
==================================
     TOTAL    (pct)     SAMPLES    (pct)     FRAME
   4444147  (55.8%)     2222023  (27.9%)     RubyRoutes::RouteSet#match
   1111207  (14.0%)     1111207  (14.0%)     Kernel#dup
   1111204  (14.0%)     1111204  (14.0%)     String#upcase
   1200004  (15.1%)      800003  (10.0%)     RubyRoutes::RouteSet#find_named_route
   1500070  (18.8%)      500016   (6.3%)     RubyRoutes::Route#generate_path
   3100077  (38.9%)      400002   (5.0%)     RubyRoutes::RouteSet#generate_path
   3500080  (44.0%)      400002   (5.0%)     block (4 levels) in <top (required)>
    400001   (5.0%)      400001   (5.0%)     Exception.exception
    200020   (2.5%)      200013   (2.5%)     Enumerable#each_with_index
    600007   (7.5%)      200003   (2.5%)     RubyRoutes::Route#cache_key_for
    200002   (2.5%)      200002   (2.5%)     String#+@
    200000   (2.5%)      200000   (2.5%)     Hash#keys
    200000   (2.5%)      200000   (2.5%)     Array#-
      3604   (0.0%)        3604   (0.0%)     String#%
      9734   (0.1%)        2567   (0.0%)     Kernel#require_relative
      1852   (0.0%)        1852   (0.0%)     String#split
      1280   (0.0%)        1280   (0.0%)     Integer#chr
      5124   (0.1%)        1028   (0.0%)     block in <module:URI>
      1348   (0.0%)         808   (0.0%)     RubyRoutes::RadixTree#split_path
      2620   (0.0%)         794   (0.0%)     RubyRoutes::RadixTree#add
      3746   (0.0%)         785   (0.0%)     RubyRoutes::Route#initialize
       813   (0.0%)         584   (0.0%)     RubyRoutes::Route#normalize_path
      4181   (0.1%)         481   (0.0%)     block in <top (required)>
      7173   (0.1%)         417   (0.0%)     Class#new
       304   (0.0%)         304   (0.0%)     RubyRoutes::Node#initialize
      3874   (0.0%)         279   (0.0%)     RubyRoutes::Router#resources
       275   (0.0%)         275   (0.0%)     Hash#merge
   7963538 (100.0%)         264   (0.0%)     Kernel#load
      8842   (0.1%)         240   (0.0%)     Kernel.require
       229   (0.0%)         229   (0.0%)     String#chomp

branch main:

ruby_routes git:(main) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :cpu, out: 'tmp/stackprof.dump'){ load 'benchmark/performance.rb' }"           
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        0.841230   0.015288   0.856518 (  0.868902)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       1.417917   0.025010   1.442927 (  1.464003)

Memory usage information:
==================================================
Memory before: 23776 KB
Memory after: 23780 KB
Memory increase: 4 KB
Routes total: 195

Performance test completed!
➜  ruby_routes git:(main) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: 'tmp/stackprof.object.dump') { load 'benchmark/performance.rb' }"
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        4.336624   0.023714   4.360338 (  4.401137)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       5.535239   0.038248   5.573487 (  6.539872)

Memory usage information:
==================================================
Memory before: 23904 KB
Memory after: 23912 KB
Memory increase: 8 KB
Routes total: 195

Performance test completed!
➜  ruby_routes git:(main) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: 'tmp/stackprof.object.dump') { load 'benchmark/performance.rb' }"
bundle exec stackprof tmp/stackprof.object.dump --text | head -n 60
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:        4.613369   0.043516   4.656885 (  4.823925)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       6.714440   0.102668   6.817108 (  9.275280)

Memory usage information:
==================================================
Memory before: 23588 KB
Memory after: 23592 KB
Memory increase: 4 KB
Routes total: 195

Performance test completed!
==================================
  Mode: object(1)
  Samples: 6652656 (0.00% miss rate)
  GC: 0 (0.00%)
==================================
     TOTAL    (pct)     SAMPLES    (pct)     FRAME
   3333127  (50.1%)     2222042  (33.4%)     RubyRoutes::RouteSet#match
   1111204  (16.7%)     1111204  (16.7%)     String#upcase
   1200004  (18.0%)      800003  (12.0%)     RubyRoutes::RouteSet#find_named_route
   2900080  (43.6%)      400002   (6.0%)     RubyRoutes::RouteSet#generate_path
   3300083  (49.6%)      400002   (6.0%)     block (4 levels) in <top (required)>
    400001   (6.0%)      400001   (6.0%)     Exception.exception
   1300073  (19.5%)      300019   (4.5%)     RubyRoutes::Route#generate_path
    200014   (3.0%)      200011   (3.0%)     Enumerable#each_with_index
    600007   (9.0%)      200003   (3.0%)     RubyRoutes::Route#cache_key_for
    200000   (3.0%)      200000   (3.0%)     Hash#keys
    200000   (3.0%)      200000   (3.0%)     Array#-
    200000   (3.0%)      200000   (3.0%)     String#+@
      3604   (0.1%)        3604   (0.1%)     String#%
      9671   (0.1%)        2528   (0.0%)     Kernel#require_relative
      1852   (0.0%)        1852   (0.0%)     String#split
      1280   (0.0%)        1280   (0.0%)     Integer#chr
      5124   (0.1%)        1028   (0.0%)     block in <module:URI>
      1348   (0.0%)         808   (0.0%)     RubyRoutes::RadixTree#split_path
      2620   (0.0%)         794   (0.0%)     RubyRoutes::RadixTree#add
       813   (0.0%)         584   (0.0%)     RubyRoutes::Route#normalize_path
      4281   (0.1%)         481   (0.0%)     block in <top (required)>
      7343   (0.1%)         404   (0.0%)     Class#new
       802   (0.0%)         400   (0.0%)     Array#map
      3943   (0.1%)         396   (0.0%)     RubyRoutes::Route#initialize
       304   (0.0%)         304   (0.0%)     RubyRoutes::Node#initialize
      3954   (0.1%)         279   (0.0%)     RubyRoutes::Router#resources
       275   (0.0%)         275   (0.0%)     Hash#merge
   6652653 (100.0%)         264   (0.0%)     Kernel#load
      8842   (0.1%)         240   (0.0%)     Kernel.require
       229   (0.0%)         229   (0.0%)     String#chomp


branch old:
ruby_routes git:(old) ✗ bundle exec ruby -r stackprof -e "StackProf.run(mode: :cpu, out: 'tmp/stackprof.dump'){ load 'benchmark/performance.rb' }"
Router created with 95 routes

Benchmarking route matching:
==================================================
                           user     system      total        real
Route matching:       77.815491   2.634275  80.449766 ( 86.775320)

Benchmarking path generation:
==================================================
                           user     system      total        real
Path generation:       1.706970   0.048732   1.755702 (  1.891630)

Memory usage information:
==================================================
Memory before: 24084 KB
Memory after: 24084 KB
Memory increase: 0 KB
Routes total: 195

This command taking too long and i should interupt with: command + c

bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: 'tmp/stackprof.object.dump') { load 'benchmark/performance.rb' }"

bundle exec ruby -r stackprof -e "StackProf.run(mode: :object, out: 'tmp/stackprof.object.dump') { load 'benchmark/performance.rb' }"
bundle exec stackprof tmp/stackprof.object.dump --text | head -n 60
