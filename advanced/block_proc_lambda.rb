class Array
  def will_delete_if
    return self unless block_given?
    each do |x|
      delete(x) if yield(x)
    end
  end
end

arr=[1,2,3]
p arr.will_delete_if
arr.will_delete_if{|x| x == 1}
p arr
=begin
def calculation(a, b)
  yield(a, b)
end

puts calculation(5, 6) { |a, b| a + b } # addition
puts calculation(5, 6) { |a, b| a - b } # subtraction
=end