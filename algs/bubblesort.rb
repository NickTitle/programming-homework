a = Array.new;

50.times do
	a << rand(1000)
end

def bubble_sort(array, pass=1)
	sorted = nil
	i = 0
	while i < array.length
		q = array[i];
		q_1 = array[i+1];
		break unless q_1
		if q > q_1
			array[i+1]=q
			array[i] = q_1
			sorted = 1
		end
		i+=1
	end

	return unless sorted	

	if pass != 1
		puts "\nPass #{pass}: "
		print array
	end
	pass +=1

	if sorted ==1
		bubble_sort(array, pass)
	end
end

bubble_sort(a)
