a = {first_name: "Hermione", last_name: "Granger"}
b = {first_name: "Ron", last_name: "Weasley"}
c = {first_name: "Ginny", last_name: "Weasley"}
d = {first_name: "Harry", last_name: "Potter"}
e = {first_name: "Draco", last_name: "Malfoy"}
names = [a, b, c, d, e]

puts "You have #{names.length} names in the names array."

names.each {|name| puts "The name is '#{name[:first_name]} #{name[:last_name]}'"}

puts "----------------------------------"

puts names.select { |i| i == 0} { |i| i == 5 }
