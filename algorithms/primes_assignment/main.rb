require './lib/problem1'
require './lib/problem2'

prime = Problem2.new(100).prime_under_max_has_most_cons_primes
p "result: #{prime}"