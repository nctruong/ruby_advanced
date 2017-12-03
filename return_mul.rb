def return_multiple
  return 1,2
rescue e => e
  e.to_s
end

x, y = return_multiple
p "x: #{x}, y: #{y}"