puts "hello"
puts "coding"
puts "dojo"

x = puts "hello, ninjas"

puts x

firstname = "Katherine"
lastname = "Krueger"

puts "your name is"
puts firstname+lastname

BEGIN {
	puts "this is in the begin block"
}

END {
	puts "this is in the end block "
}

puts "Firstname is #{firstname} and the last name is #{lastname}"


puts "--------------------------"

age = 20

if age <=21
	puts "you are too young"
else
	puts "not yet"
end

unless age >= 21
	puts "you are too young"
end	



puts "first name is %s last name %s" % [firstname, lastname]

number = 30
if number % 3 == 0 && number % 5 == 0
  puts "FizzBuzz"
elsif number % 3 == 0
  puts "Fizz"
elsif number % 5 == 0
  puts "Buzz"
end

print "------------------------"

age = 13

if !(age < 21)
	puts "welcome to the party!"
else 
	puts "not yet"
end 

unless !(age <21)
	puts "welcome"
else 
	puts "go home"	
end	

for i in 0..5 
  puts "Value of local variable is #{i}" 
end

i = 0
num = 5
while i < num do
  puts "Inside the loop i = #{i}"
  i += 1  
  break if i == 2  
end

for i in 0..5 
  next if i == 2
  puts "Value of local variable is #{i}"   
end