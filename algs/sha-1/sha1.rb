require 'digest/sha1'

def sha1(src)
	salt = "sodiumchloride"
	salted_src = src+salt
	hash = Digest::SHA1.hexdigest salted_src
	puts "\nOriginal:#{src}\nSalted:#{salted_src}\nHash:#{hash}"
end

ARGV.each do |arg|
	sha1(arg)
end
