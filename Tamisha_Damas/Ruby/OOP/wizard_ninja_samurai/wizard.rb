require_relative 'human'
class Wizard < Human # Wizard inherits from Human
  def initialize
    super
    @health = 50
    @intelligence = 25
    self
  end

  def heal
    @health += 10
    self
  end

  def fireball(obj)
    # Wizard should have a method called fireball, which when invoked, decrease the health of whichever object it attacked by 20
    if obj.class.ancestors.include?(Human)
      obj.health -= 20
      true
    else
      false
    end
  end
end

Wizard1 = Wizard.new
Wizard1.display_all
