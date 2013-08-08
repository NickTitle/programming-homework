a = Array.new
1000.times do
	a << rand(5000)
end

puts "\nOriginal:\n"
print a
puts "\n"

def merge_sort(array, pass = 1)

		a_1 = Array.new

		if array.length >1

			a_final = Array.new
			
			mid = array.length/2

			if !array.length.even?
				mid +=1
			end
			a_1 = array.each_slice(mid).to_a

			a_1[0] = merge_sort(a_1[0])
			a_1[1] = merge_sort(a_1[1])
			#a_1.each do |ar|
			#	ar = merge_sort(ar)
			#end
			a_final = merge(a_1[0],a_1[1])

		else
			return array
		end	
		
end

def merge(arr1,arr2)

	if arr1.class == Fixnum
		arr1 = [arr1]
	end
	if arr2.class == Fixnum
		arr2 = [arr2]
	end

	pos1 = 0
	pos2 = 0

	puts "\n\nMerging these 2 arrays\n"
	print arr1
	print arr2
	puts "\n\n"

	
	result = Array.new

	while result.length < (arr1.length + arr2.length)

		v1 = arr1[pos1]
		v2 = arr2[pos2]
		
		if v1 == nil
			if v2 != nil
				result << v2
				pos2 += 1
			end
		elsif v2 == nil
			result << v1
			pos1 += 1
		else
			comp = v1 <=> v2

			if comp  == -1
				result << v1
				pos1 += 1
			elsif comp == 1
				result << v2
				pos2 += 1
			else
				result << v1
				pos1 += 1
			end
		end
	end
	print result
	result
	#puts "Press enter to continue"
	#gets
end

#merge([21,25,29], [5,6,20, 30])
merge_sort(a)
