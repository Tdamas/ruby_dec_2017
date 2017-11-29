a = [ "I", "am", "always", "hungry", "in", "the", "mornings"]
b = [7, 14, 21, 55, 37, 52, 34]
c = ["always", 55]

puts "I am #{b.at(2)} years old"
puts "I love waking up early in the #{a.fetch(6)}."
a.delete_at(2)
puts a.join(" ")
puts (a.length + b.length)
puts b.sort.to_s
puts b[1, 3].to_s
puts b.shuffle.to_s
puts a.join(" ")
puts b.join(" : ")
puts a.insert(2, b).to_s
puts b.values_at(1, 3, 5).to_s
