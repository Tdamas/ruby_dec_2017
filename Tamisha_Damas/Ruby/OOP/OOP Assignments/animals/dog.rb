require_relative 'mammal'

class Dog < Mammal
	def pet(num)
		@health += 5*num
		self	
	end	

	def walk(num)
		@health -= 1*num
		self
	end	
	
	def run(num)
		@health -= 10*num
		self
	end	
end

fido = Dog.new
p fido


fido.walk(3).run(2).pet(1).display_health