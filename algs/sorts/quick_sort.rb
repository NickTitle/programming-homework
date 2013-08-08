a = Array.new
5.times do
	a << rand(5000)
end

def quicksort(array, pass=0)

	if array.length <2
		return
	elsif array.length ==2
		array[0]=[array[0]]
		array[1]=[array[1]]
	end

	pivot_pos = rand(array.length)
	pos1=0
	pos2=array.length-1

	while (pos1<pivot_pos && pos2>pivot_pos)
		v1=array[pos1]
		v2=array[pos2]
		v_pivot=array[pivot_pos]

		puts "\n"
		puts "pos1=#{pos1} pos2=#{pos2} pivot=#{pivot_pos}"
		pos2=array.length
		print array
		puts "\n"
		
		if v2 > v1
			array[pos1], array[pos2] = v2, v1
		end

		if pos1 < pivot_pos
			pos1 += 1
		end
		if pos2 > pivot_pos
			pos2 -= 1
		end
	end

end

quicksort(a)
