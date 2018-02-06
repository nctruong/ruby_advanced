def solution(t)
  # write your code in Ruby 2.2
  res = 0
  t.each_with_index do |el,idx|
    res = i = idx
    (el..t.last).each {|temp| break if temp > el }
  end
  res > 0 ? res - 1 : res
end
array = [5, -2, 3, 8, 6]  #[51, 88, 62, 68, 98, 93, 51, 67, 91, 4, 34]
p solution array