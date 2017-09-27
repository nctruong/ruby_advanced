# arr = []
# n = gets.strip.to_i
# (1..n/2).each_with_index do |i|
#   a = gets.strip.split(" ")
#   arr << a
# end
# arr = [[1,2,3,4],[5,6,7,8],[9,1,2,3],[4,5,6,7]]
# one = []
# # two dimensional array to one
# arr.each do |a|
#   puts a.join(" ")
#   a.collect{|e| one << e}
# end
# # 4 max values
# puts "max: #{one.uniq.max(4)}"
class AccessLevel
  def something_interesting
    another = AccessLevel.new
    puts "\n"
    another.public_method
    another.protected_method
    another.private_method
  end

  def public_method
    puts "Public method. Nice to meet you."
    puts " *** public_method calls private_method ***"
    private_method
  end

  protected

  def protected_method
    puts "Protected method. Sweet!"
  end

  private

  def private_method
    puts "Incoming exception!"
  end
end

AccessLevel.new.something_interesting
#=> Public method.  Nice to meet you.
#=> Protected method.  Sweet!
#=> NoMethodError: private method ‘private_method’ called for
#=>  #<AccessLevel:0x898c8>


