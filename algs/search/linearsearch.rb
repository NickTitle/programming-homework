a = Array.new
50.times do |i|
	a << rand(50)
end

search_val = a[rand(a.length-1)]

def linear_search(array, value)

	i = 0
	while i<array.length
		if array[i] == value
			puts "Found #{value} at index #{i}"
		end
		i += 1
	end

end

linear_search(a, search_val)
