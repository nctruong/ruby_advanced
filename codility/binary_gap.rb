# A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by
# ones at both ends in the binary representation of N.
#
#     For example, number 9 has binary representation 1001 and contains a binary gap of length 2.
#     The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3.
#     The number 20 has binary representation 10100 and contains one binary gap of length 1.
#     The number 15 has binary representation 1111 and has no binary gaps.
#
#     Write a function:
#
#                 def solution(n)
#
#                   that, given a positive integer N, returns the length of its longest binary gap.
#                   The function should return 0 if N doesn't contain a binary gap.
#
# For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and
# so its longest binary gap is of length 5.
#
# Assume that:
#
# N is an integer within the range [1..2,147,483,647].
# Complexity:
#
# expected worst-case time complexity is O(log(N));
# expected worst-case space complexity is O(1).

def solution(n)
  # write your code in Ruby 2.2
  arr=n.to_s(2).split('').collect{|el| el.to_i}
  indexes = []
  arr.each_with_index {|el, idx| indexes << idx if el==1 }
  max = 0
  gap = prev = -1
  return max if indexes.size == 1
  indexes.each_with_index do |el,i|
    unless prev == -1
      gap  = el - prev - 1
      max = gap if gap > max
    end
    prev = el
  end
  max
end

p solution 1