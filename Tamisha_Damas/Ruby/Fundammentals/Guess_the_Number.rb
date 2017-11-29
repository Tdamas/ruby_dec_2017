def guess_number guess
  number = 25
  puts "Guess was too high" unless guess <= number
  puts "Guess was too low" unless guess >= number
  puts "You got it" if guess == number
end
guess_number 25
