
# 1

x = [3,5,1,2,7,9,8,13,25,32]

sum = 0
x.each{ |i| sum+=i }
p sum
p x.reject { |i| i < 10 }

# 2 

x = ["stan", "kenny", "kyle", "mr hat", "mr garrison", "wendy", "butters"]
p x.shuffle; p x.find_all { |i| i.length > 5}

# 3 

x = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
vowels = ["a", "e", "i", "o", "u"]

x.shuffle!; p x.last; p x.first
if vowels.include? x.first
	puts "by golly, that's a vowel!"
end	

# 4 

x = []; 
for i in 0...10
	x.push(rand(55..100))
end	
p x
p x.length

# 5 

x = []; 
for i in 0...10
	x.push(rand(55..100))
end	
p x.sort!; p x.min; p x.max

# 6


x = ""; 5.times{x << (65 + rand(25)).chr}
p x

# 7 

y = []
x = ""

for i in 0..9
	for a in 0..4
		x << (65 + rand(25)).chr
	end
	y.push(x)
	x = ""
end
p y

# 7 the ruby way
x = []

10.times do 
	x << (0...5).map {(65 + rand(25)).chr}.join("")
end