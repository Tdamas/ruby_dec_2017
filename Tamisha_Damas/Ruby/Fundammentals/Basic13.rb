# # Print numbers 1-255
# for i in 1..255
#   puts "#{i}"
# end

#Print odd numbers between 1-255
# for i in 1..255
#   if i % 2 == 1
#     puts i
#   end
# end

# Print sum
# def sum_num()
#   sum = 0
#   for i in 0..255
#     puts sum = i + sum
#   end
# end
# p sum_num

# iterating through an Array
# def it_arr()
# x = [1, 3, 5, 7, 9, 13]
# x.each {|y| p y}
# end
# it_arr

# Find max value for the Array
# def max_arr()
# x = [-3, -5, -7]
# x.max
# end
# puts max_arr

# Find the average of an Array
# def avg()
# arr = [2, 10, 3]
# arr.reduce(:+) / arr.size
# end
# puts avg

# Greater than Y
# def greater()
# arr = [1, 3, 5, 7]
# y = 3
# p arr.find_all {|i| i > y}
# end
# greater

# Square the Values
# def square()
# x = [1, 5, 10, -2]
# p x.collect { |i| i * i }
# end
# square

#Eliminate negative numbers
# def elem()
# x = [1, 5, 10, -2]
# p x.map {|i| if i < 0 then i = 0 else i end}
# end
# elem

# Max Min average
# def max_min_avg()
# x = [1, 5, 10 ,-2]
# puts x.max
# puts x.min
# puts x.reduce(:+) / x.size
# end
# max_min_avg

# Shifting values in the array
# def shift()
# x = [1, 5, 7, 10, -2]
# p x.rotate
# end
# shift

# Number to strings
# def num_str()
# x = [-1, -3, 2]
# p x.map {|i| if i < 0 then i = "Dojo" else i end}
# end
# num_str
