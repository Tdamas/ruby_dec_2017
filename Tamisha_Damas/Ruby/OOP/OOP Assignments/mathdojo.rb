# class MathDojo
# 	@val
# 	attr_accessor :val

# 	def initialize
# 		@val = 0
# 		self
# 	end
	
# 	def add(a,b=0)
# 		@val += (a+b)
# 		p @val
# 		self
# 	end
	
# 	def subtract(a,b=0)
# 		@val -= a
# 		@val -= b
# 		p @val
# 		self
# 	end	

# 	def result
# 		puts @val
# 	end		


# MathDojo.new.add(2).add(2, 5).subtract(3, 2).result


class MathDojo2
	@val
	attr_accessor :val

	def initialize
		@val = 0
		self
	end
	
	def add(*a)
		a.flatten!
		p a
		for item in a
			@val += item
			p @val
		end	
		self
	end
	
	def subtract(*a)
		a.flatten!
		p a 
		for item in a
			@val -= item
			p @val
		end
		self
	end	

	def result
		puts @val
	end		

end

MathDojo2.new.add(1).add(3, 5, 7, 8, 2, 4.3, 1.25).subtract(2,3, 1.1, 2.3).result

p "--------------------"

MathDojo2.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result