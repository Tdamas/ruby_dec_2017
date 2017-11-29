BEGIN {
	puts "this is in the begin block"
}

END {

	puts "thethethethe that's all, folks!"
}
a = ["cartman", "kyle", "kenny", "stan", "wendy", "bebe"]
b = [2,4,7,2,7,5,1,23,9,5,33,0]

puts "--------------------"

puts b.class

puts "--------------------"

puts b.shuffle.join("-")

puts "--------------------"

puts a.to_s

puts "--------------------"


puts a.at(2) 

puts "--------------------"

puts b.delete(7)
puts b

puts "--------------------"

puts a.push("mr. hat")

puts "--------------------"

puts a.pop()

puts "--------------------"

puts b.length

puts "--------------------"

puts a.sort
puts b.sort

puts "--------------------"

puts a.slice(3..5)
puts a.slice(3...5)

puts "--------------------"


puts a.join

puts "--------------------"

puts a.insert(2, "mr. slave")

puts "--------------------"

puts b.values_at(2...4)

puts "--------------------"

puts a.values_at(1..4).join(' and ')

puts "--------------------"

