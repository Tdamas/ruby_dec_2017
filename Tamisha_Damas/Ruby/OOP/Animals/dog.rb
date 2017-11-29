require_relative 'mammals'
class Dog < Mammal # Dog inherits from Mammal
  def pet
    @health += 5
    self
  end
  def walk
    @health -= 1
    self
  end
  def run
    @health -= 10
    self
  end
end
Dog1 = Dog.new
Dog1.health
Dog1.walk.walk.walk.run.run.pet.display_all

3.times { Dog1.walk }
2.times { Dog1.run }
Dog1.pet.display_all

3.times do
  Dog1.walk.run
end

for i in 1..3
  Dog1.walk
end
