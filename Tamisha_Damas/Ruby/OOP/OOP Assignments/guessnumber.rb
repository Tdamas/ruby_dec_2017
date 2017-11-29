def guess_number guess
    number = 25
    if guess > number
    	puts "#{guess} is too high!"
    elsif guess < number
    	puts "#{guess} is too low!"
    elsif guess == number
    	puts "#{guess} is just right!"		
	end 
end	

guess_number 22
guess_number 89
guess_number 25

puts "----------------------"

def guess_number guess
    number = 25
    unless guess <= number
    	puts "#{guess} is too high!"
    end
    unless guess >= number
    	puts "#{guess} is too low!"
    end	
    unless guess != number
    	puts "#{guess} is just right!"		
	end 
end	

guess_number 22
guess_number 89
guess_number 25
