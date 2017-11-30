require_relative 'human'
class Ninja < humans
  def initialize
    super
    @stealth = 175
    self
  end
  def steal(victim)
    attack(victim)
    @health += 10
  end
  def get_away
    @health -= 15
  end
end
