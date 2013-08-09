a = Array.new
12.times do
	a << rand(5000)
end

def quicksort(array, pass=0)

	if pass == 0
		puts "\nOriginal:"
		print array
	end
	
	if array.class == Fixnum || array.length < 2
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
	end

	pivot_pos = array.index(pivot)

	a1=array.slice(0...pivot_pos)
	a2=array.slice(pivot_pos+1..array.length-1)
	a_f = Array.new
	a_f << a1
	a_f << [pivot]
	a_f << a2
	a_f.length.times do |i|
		a_f[i]=quicksort(a_f[i],pass+1)
	end
	puts "\n#{pass} iterations deep"
	print a_f.flatten!	
	return a_f
end

quicksort(a)
