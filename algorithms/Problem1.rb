require 'benchmark'

def primes1_below(max)
  start = 2
  primes = (start..max).to_a
  (start..max).each do |no|
    (start..no).each do |num|
      if ( no % num  == 0) && num != no
        primes.delete(no)
        break
      end
    end
  end
  primes
end

def primes2_below(max)
  primes = (0..max).to_a
  primes[0] = primes[1] = nil
  primes.each do |p|
    next unless p
    break if p * p > max
    idx = 1
    loop {
      idx += 1
      multiple = p * idx
      primes[multiple] = nil
      break if multiple > max
    }
  end
  primes.compact
end

MAX = 2000000
# result1 = Benchmark.measure do
#   p "resutl: #{primes1_below(MAX).inject(:+)}"
# end
# p "1st method #{result1}"

result2 = Benchmark.measure do
  p "resutl: #{primes2_below(MAX).inject(:+)}"
end
p "2nd method #{result2}"

