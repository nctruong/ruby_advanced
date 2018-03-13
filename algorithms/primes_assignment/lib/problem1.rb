# Class to calculate the primes below a max number.
# This is also the code solving problem#1
class MyPrimes
  attr_accessor :max, :primes

  def initialize(max)
    @max = max
    @primes = primes2_below(max)
  end

  private

  # main method solved 1st problem
  def primes2_below(max)
    @primes = (0..max).to_a
    @primes[0] = @primes[1] = nil
    @primes = eliminate_not_primes
    primes.compact
  end

  def eliminate_not_primes
    @primes.each do |prime|
      next unless prime
      break if prime * prime > max
      eliminate_multiples_of_prime(prime)
    end
    primes
  end

  def eliminate_multiples_of_prime(prime)
    idx = 1
    loop do
      idx += 1
      multiple = prime * idx
      @primes[multiple] = nil
      break if multiple > max
    end
  end

  def prime?(num)
    primes.include?(num)
  end
end
