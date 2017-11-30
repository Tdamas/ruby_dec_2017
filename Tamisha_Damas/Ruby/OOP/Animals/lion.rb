require_relative 'mammals'
class Lion < Mammal #Lion inherits from Mammal
  def health
    #S
    super
    @health = 170
    puts "This is a Lion #{@health}"
    self
  end
  def fly
    @health -= 10
    self
  end
  def attack_town
    @health -= 20
    self
  end
  def eat_humans
    @health += 20
    self
  end
end
Lion1 = Lion.new
Lion1.health
Lion1.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_all
