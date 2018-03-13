# Applying euler rule "http://mathworld.wolfram.com/PrimeSums.html"
# Calculating n as the limitation index of primes array.
class Problem2 < MyPrimes
  def initialize(max)
    super
  end

  def prime_under_max_has_most_cons_primes
    most_consecutive_primes_under_max.inject(:+)
  end

  private

  def most_consecutive_primes_under_max
    euler_n.to_i
    index, new_euler_n = first_index_primes_have_sum_under_max(euler_n)
    find_longest_primes(index, new_euler_n)
  end

  # Calculating n as the limitation index of primes array.
  def euler_n
    n = 1
    loop do
      nsum = 0.5 * (n * n) * Math.log(n)
      n += 1
      break if nsum >= max
    end
    n
  end

  # Finding the range of index of last prime number in
  # consecutive primes expected
  def first_index_primes_have_sum_under_max(euler_n)
    new_euler_n = reduce_euler_n(euler_n)
    index = index_biggest_sum_primes_under_max(new_euler_n)
    [index, new_euler_n]
  end

  # From euler_n, we reduce the limitation until get biggest sum under max.
  # This biggest sum can be not a prime.
  def reduce_euler_n(euler_n)
    new_euler_n = euler_n
    sum = primes.take(euler_n).inject(:+)
    loop do
      break if sum <= max
      new_euler_n -= 1
      first_n_primes = primes.take(new_euler_n)
      sum = first_n_primes.inject(:+)
    end
    new_euler_n
  end

  # Finding index of primes having biggest sum of primes
  # which is a prime by range (0..new_euler_n)
  # This biggest sum must be a prime
  def index_biggest_sum_primes_under_max(new_euler_n)
    subprimes = primes.take(new_euler_n)
    primes_sum = index = 0
    (1..new_euler_n - 1).each do |i|
      sum = subprimes.take(i).inject(:+)
      if sum > primes_sum && prime?(sum)
        index = i
        primes_sum = sum
      end
    end
    index
  end

  # Finally, assume that the consecutive primes expected is an array
  # with index in range (begin..end).
  # Thus, 'p_begin' will be in range (0..index - 1)
  # 'p_end' will be in range (index - 1..new_euler_n)
  # Doing loops to get sum of the most consecutive primes expected
  def find_longest_primes(index, new_euler_n)
    longest_primes = [0]
    p_begin = 0
    p_end = index - 1
    subprimes = primes.take(new_euler_n)
    loop do
      break if p_end > new_euler_n
      loop do
        break if p_end < p_begin || p_begin > index
          cons = subprimes[p_begin..p_end]
          sum_is_prime = prime?(cons.inject(:+))
          longest_primes = compare_primes(longest_primes, cons) if sum_is_prime
          p_begin += 1
      end
      p_end += 1
      p_begin = 0
    end
    longest_primes
  end

  def prime?(num)
    primes.include?(num)
  end

  def compare_primes(current, new_prime)
    longest_primes = current
    if new_prime.size > current.size
      longest_primes = new_prime
    # if same sizes, calculating sum of current and new array of primes
    elsif new_prime.size == current.size
      longest_primes = new_prime if new_prime.inject(:+) > current.inject(:+)
    end
    longest_primes
  end
end
