# require 'benchmark'
# result = Benchmark.measure do
# a = [5,2,4,1,2]
# b = a.uniq
#
# for i in b
#   print i," appears ",a.count(i)," times\n"
# end
# print b
# end
# print result


require 'benchmark'

result = Benchmark.measure do
  a = [5,2,4,1,2]
  counts = a.each_with_object(Hash.new(0)) do |element, counter|
    counter[element] += 1
  end
  # => {5=>1, 2=>2, 4=>1, 1=>1}
  # i.e. one 5, two 2s, one 4, one 1.
  counts.each do |element, count|
    puts "#{element} appears #{count} times"
  end
end
p result
print result