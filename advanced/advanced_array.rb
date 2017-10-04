zen, john, will = [[4, 8], [3, 16], [23, 42, 15]]

p zen
p john
p will

[[1, 2, 3, 4], [42, 43]].each { |a, b| puts "#{a} #{b}" }

[[1, 2, 3, 4], [42, 43]].each do |element|
  a, b, c, d = element
  puts "#{a} #{b} #{c} #{d}"
end

car, *cdr = [42, 43, 44]
*initial, last = [42, 43, 44]
first, *middle, last = [42, 43, 44, 45, 46, 47]
p first, middle, last

def zen(*args)
  [args.first, args.last]
end
p zen(42, 43, 44, 45, 46)

zen = *(0..42)
p "zen by *(0..42) : #{zen}"
str = *"Zen"

zen = *(1..42)
str = *"Zen"

p "------------------------------- HASH"
puts Hash[4, 8]
puts Hash[ [[4, 8], [15, 16]] ]

ary = [[4, 8], [15, 16], [23, 42]]
puts Hash[*ary.flatten]

p ary.flatten # Returns a new array that is a one-dimensional flattening of this array (recursively)

[4, 8, 15, 16, 23, 42].count { |e| e % 2 == 0 }

[4, [8], [15], [16, [23, 42]]].flatten(1) # for array with 1 element

p [4, 8, 15, 16, 23, 42].zip([42, 23, 16, 15, 8])

p [4, 8, 15, 16, 23, 42].slice(2)
p [4, 8, 15, 16, 23, 42].slice(2..5)