#NOTE-- this assignments was supposed to be "Wizard, Ninja, Samurai", all objects inheriting from the class Human. I made some changes. Enjoy.

p "------------HUMAN----------------"

class Human
	@strength
	@intelligence
	@stealth
	@health

	attr_accessor :strength, :intelligence, :stealth, :health

	def initialize strength: 3, stealth: 3, intelligence: 3, health: 100
		@strength = strength
        @stealth = stealth
        @intelligence = intelligence
        @health = health
    end

    def health
    	p @health
    	if @health < 1
    		puts "Deceased"
    	end	
    	self
    end	

    def weaken(amt)
    	@health -= amt
    	self
    end	


    def attack(opponent)
    	if opponent.class.ancestors.include?Human
    		opponent.weaken(10)
    	self
    	end
    end
end
    

bob = Human.new
jane = Human.new

jane.attack(bob)

p bob

p "------------WITCH----------------"

class Witch < Human
	def initialize
        puts "Magic is everywhere"
        options = {health: 50, intelligence: 25}
        super options
        self
    end

    def heal
    	puts "Reparifors"
    	@health += 10
    	self
    end	

    def fireball(opponent)
    	puts "Fiendfyre"
    	if opponent.class.ancestors.include?Human
    		opponent.weaken(20)
    	self
    	end	
    end
end	

hermione = Witch.new

hermione.fireball(bob)

p bob

p "------------SHIELDMAIDEN----------------"


class Shieldmaiden < Human
	def initialize
	    puts "I am no man"
	    options = {stealth: 175}
	    super options
	    self
	end

	def plunder(opponent)
		puts "Pay the iron price"
		opponent.weaken(10)
		@health += 10
		self
	end
	
	def get_away
		puts "Retreat is the better part of valour"
		@health -= 15
		self	
	end	
end	

eowyn = Shieldmaiden.new

eowyn.plunder(bob)

p bob


p "------------VALKYRIE----------------"

class Valkyrie < Human
	@@how_many = 0

	def initialize
	    puts "Not sure what a valkyrie even sounds like..."
	    options = {health: 200}
	    super options
	    @@how_many += 1
	    self
	end

	def meditate
		@health = 200
		self
	end
	
	def deathblow(opponent)
		health = opponent.health
		opponent.weaken(health)
		self
	end	

	def how_many
		p @@how_many
		self
	end	
end	

brunhilde = Valkyrie.new

p brunhilde.health # still not able to call this in order to evaluate and delete

brunhilde.deathblow(bob)

p bob