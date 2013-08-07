a = Array.new
25.times do
	a << rand(50)
end

puts "\nOriginal: "
print a

def insertion_sort(array, pass = 1)
	i = 1
	sorted = nil
	while i<array.length
		j = i-1
		while j >= 0
			if array[i] < array [i-1]
				array[i], array[i-1] = array[i-1], array[i]
				sorted = 1
			end
			j-=1
		end
		i+=1
	end

		puts "\nPass #{pass}\n"
		pass += 1
		print array

	if sorted == 1
		insertion_sort(array, pass)
	end
end

insertion_sort(a)
