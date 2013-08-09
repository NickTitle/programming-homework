a = Array.new
10.times do |i|
	a << rand(500)
end

val = a[rand(a.length-1)]

def binary_search (array,val, sorted=0, range=[0,array.length-1])

	puts "Range:#{range}"	
	if range[0]==range[1]

		if array[range[0]] == val
			puts "\n Found #{val} at index #{range[0]}"
		else
			puts "\n No instance of #{val} found in the array"
		end

		return

	end

	if sorted == 0
		array.sort!
		sorted = 1
	end

	mid_index = (range[1]+range[0])/2
	mid = array[mid_index]

	puts "mid_index:#{mid_index}, mid:#{mid}, val:#{val}"
	print array
	gets
	
	if mid >= val
			range[1]=mid_index
			binary_search(array,val, sorted, range)
	else 
			range[0]=mid_index+1
			binary_search(array,val, sorted, range)
	end

end

binary_search(a, val)
