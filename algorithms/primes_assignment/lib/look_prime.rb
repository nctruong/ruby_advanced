class LookPrimes < MyPrimes
  def initialize(args)
    @primes = args[:primes]
    @index = args[:index]
    @euler_n = args[:euler_n]

    @p_begin = 0
    @p_end = @index - 1
    @longest_primes = [0]
  end

  # Assume that the consecutive primes expected is an array
  # with index in range (begin..end).
  # Thus, 'p_begin' will be in range (0..index - 1)
  # 'p_end' will be in range (index - 1..new_euler_n)
  # Doing loops to get sum of the most consecutive primes expected
  def look_up_longest_primes
    loop do
      break if p_end_out_of_range?
      loop do
        break if p_begin_out_of_range?
        refine_primes
        @p_begin += 1
      end
      @p_end += 1
      @p_begin = 0
    end
    longest_primes
  end

  private

  attr_reader :primes, :euler_n
  attr_accessor :p_begin, :p_end, :index, :longest_primes

  def refine_primes
      cons = primes[p_begin..p_end]
      if sum_is_prime?(cons)
        @longest_primes = most_cons_primes(longest_primes, cons)
      end
  end

  def most_cons_primes(current, new_prime)
    @longest_primes = current
    if new_prime.size > current.size
      @longest_primes = new_prime
      # if same sizes, calculating sum of current and new array of primes
    elsif new_prime.size == current.size
      @longest_primes = new_prime if new_prime.inject(:+) > current.inject(:+)
    end
    longest_primes
  end

  def p_end_out_of_range?
    p_end > euler_n
  end

  def p_begin_out_of_range?
    p_end < p_begin || p_begin > index
  end

  def sum_is_prime?(cons)
    prime?(cons.inject(:+))
  end
end
