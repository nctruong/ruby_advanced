
@arr = [2, 4, 6, 8, 3]

def process(i)
	xrang = (0..(i - 1)).to_a.reverse
	key	= 0
	for k in xrang
		if @arr[i] < @arr[k]
			key = k
		end
	end
	
	if key != 0
		@arr.insert(key, @arr[i])
		@arr.delete_at(i+1)
	end
end

for i in 1..@arr.size - 1 
	process(i)
	puts @arr.join(", ")
end
