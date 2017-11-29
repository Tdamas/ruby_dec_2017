a = [1,2,5,6,7,3,9,4,2,6,8,9,10]

# puts a.include?(15)

# puts a.include?(5)

# puts a.last 
 
# puts a.max

# puts a.min

# puts a.keep_if { |i| i%2 == 0}



user = {"name": "kittens"}

puts user

puts user[:name]

def test 
  yield 5 
  puts "You you have many kittens." 
  yield 100 
end 
test { |i| puts "You have #{i} kittens." }