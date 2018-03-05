# define new method by override
class Array
  def foldl(method)
    inject {|result, i| result ? result.send(method, i) : i }
  end
end
puts [1,2,3].foldl("-")

# - using eval (#Q => string as code)
#   - %Q[ ] - Interpolated String (default): accept #{} syntax
#   - %q[ ] - Non-interpolated String: except #{} syntax
def relay(array, data_type)
  # Write your code here
  p "argument: " << array.to_s << ", " << data_type
  q = %Q{a.to_#{data_type}}
  array.collect{ |a| eval q }
end

p relay [1,2,3,4,5], "s"