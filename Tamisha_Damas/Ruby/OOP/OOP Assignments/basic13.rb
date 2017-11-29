# # Print 1-255

# (1..255).collect{ |i| puts i}

# # Print odd numbers between 1-255

# puts (1..255).reject{ |i| i % 2 == 0}

# # Print Sum

# sum = 0
# (0..255).each { |i| sum+=i; puts "New number: #{i}, Sum: #{sum}" }

# Iterating through an array

# x = [1,3,5,7,9,13]

# x.collect { |i| puts i }

# # Find max

# x = [1,4,0,-4,5,-9,13,4]

# x.sort!; puts x[x.length-1]
# puts.max

# # Average

# a = [1,2,3,4,5,6,34,56,7,3,2,4,15567,5]

# sum = 0; count = 0; a.each { |i| sum+=i; count+=1 }; puts sum/count

# # Odd Numbers

# y = []

# (0..255).each { |i| y.push(i) if i % 2 != 0 }
# p y

# # Greater than Y

# a = [2,3,4,5,68,8,5,1,2,4,56,3,]
# y = 8

# count = 0; a.each { |i| count += 1 if i > y}
# p count


# # Square the values

# x = [2,4,5,7,8,42,4,457,67,34]

# x = x.collect { |i| i*i }; p x

# Eliminate Negative Numbers

p "each_index:"
x = [3,-4,6,-78,12,-3,4,1]
p x.each_index{ |n| if x[n] < 0 then x[n] = 0 end}


# Max Min Ave

x = [3,4,5,7,4,245,456,78,34,2,4,532,2,5,76]

p x.max

p x.min 

count = 0; sum = 0; x.each{ |i| count+=1; sum+=i}
p sum/count

# Shifting the Values in the Array

x = [1,2,3,4,5]

p x.rotate!(1)[x.length-1]=0

# Number to String

x = [2,-4,5,7,-2,8]

x.each { |i| if i < 0 
	puts "dojo" 
else 
	puts i 
end }

