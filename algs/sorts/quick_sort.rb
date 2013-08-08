a = Array.new
11.times do
	a << rand(5000)
end

def quicksort(array, pass=0)

	array=[array] unless array.class == Array
	
	if array.length < 2
		puts "\nEscape"
		return array
	end

	pos1=0
	pos2=array.length-1
	pivot_pos = rand(array.length-1)
	pivot = array[pivot_pos]

	while (pos1<pivot_pos || pos2>pivot_pos) && pos1 < pos2
		while array[pos1] < pivot
			pos1 += 1
		end
		while array[pos2] > pivot
			pos2 -= 1
		end
		array[pos1], array[pos2] = array[pos2], array[pos1]
		puts "\n"
		print array
	end

	pivot_pos = array.index(pivot)
	a_1 = Array.new
	a_2 = Array.new
	(0...pivot_pos).each do |i|
		a_1 << array[i]
	end
	(pivot_pos...array.length-1).each do |i|
		a_2 << array[i]
	end
	
	a_final = Array.new
	
		a_1=quicksort(a_1)
		a_final = a_final + a_1 unless a_1 == nil
	
		a_final <<  pivot unless pivot == nil
		
		a_2=quicksort(a_2)
		a_final = a_final + a_2 unless a_2 == nil
	
	puts "\nfinal array:"
	print a_final
	puts "\n"

end

quicksort(a)
