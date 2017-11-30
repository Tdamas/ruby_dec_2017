# The Number Game
# By Tamisha Damas

# Get the player's name and Greet them by name
puts "Welcome to 'Get My Number!'"
print "What's your name?"
input = gets
name = input.chomp
puts "Welcome, #{name}!"

# Store a random number for the player to guess
puts "I've got a random number between 1 and 100.", "Can you guess it?"
target_num = rand(100) + 1

# Keep track of how many guesses the player made.
num_guesses = 0

# Track wheter the player has guessed correctly.
guessed_it = false

until num_guesses == 10 || guessed_it

  # Before each guess, let them know how many guesses they have left out of 10.
  puts "You've got #{10 - num_guesses} guesses left"
  # Prompt the player to make a guess as to what the target number is
  print "Make a guess."
  guess = gets.to_i

  num_guesses += 1

  # Compare player's guess to random target Number
  # Print the appropriate message
  if guess < target_num
    puts "Oops. Your guess is too LOW."
  elsif guess > target_num
    puts "Oops. Your guess was too HIGH."
  elsif guess == target_num
    puts "Great job, #{name}!"
    puts "You guessed my number in #{num_guesses} guesses."
    guessed_it = true
  end
end

# If player ran out of turns, tell them what the number was.
unless guessed_it
  puts "Sorry. You didn't get my number. (It was #{target_num}.)"
end
