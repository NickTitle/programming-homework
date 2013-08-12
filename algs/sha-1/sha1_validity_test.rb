require 'digest/sha1'

def sha_test(request, validation)

	salt = "sodiumchloride"
	salted_req = request+salt
	hash = Digest::SHA1.hexdigest(salted_req)
	
	if hash == validation
		puts "\nRequest is valid.\n"
	else
		puts "\nWarning: validation failed for request\n"
	end

end

sha_test(ARGV[0],ARGV[1])
