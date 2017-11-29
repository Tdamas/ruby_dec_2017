# # Create an Array with the following values
# arr = [3,5,1,2,7,9,8,13,25,32]
#
# # Print the sum of the values in the Array
# p arr.reduce(:+)
#
# # Return only values greater than 10
# p arr.reject {|i| i < 10}

# Create an Array with the following values
# x = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
# # p x.shuffle.each {|i| puts i}
# puts x.select {|x| x.length > 5}

#Create an array that contains all 26 letters in the alphabet
# arr = ("a".."z").to_a
# # p arr
# # p arr.shuffle.last
# p arr.shuffle.first
# p shuffled = arr.shuffle
# p "#{shuffled.first} is a vowel" if ["a","e","i","o","u"].include? shuffled.first

# Generate an array with 10 random numbers between 55-100.
# # first create an empty array
# arr = Array.new
# # p Array.new(10) { Random.new.rand(55..100) }
# arr2 = Array.new(10) { Random.new.rand(55..100) }
# p arr2.sort { |a, b| a <=> b }
# p arr2.max
# p arr2.min

#Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character; use a map function and a range to do this)
#Create an empty string

def stringrand()
  str = ""
  for i in 1..5
    str << (65+rand(25)).chr
  end
  return str
end
p stringrand

# #Generate an array with 10 random strings that are each 5 characters long
# arr = Array.new
# p Array.new(10) { Random.new.rand(55..100).to_s }
