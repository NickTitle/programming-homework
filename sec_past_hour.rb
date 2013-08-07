currTime = Time.new
puts "It is now : #{currTime} "

secpasthour = (currTime.min*60 + currTime.sec)

puts "We are now #{secpasthour} seconds past the hour"
