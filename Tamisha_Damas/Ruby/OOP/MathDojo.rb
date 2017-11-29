# class MathDojo
#   attr_reader :result
#
#   def initialize
#     @result = 0
#   end
#
#   def add *numbers
#     # numbers.each { |num| @result += num}
#     @result += numbers.flatten.reduce(0, :+)
#     self
#   end
#
#   def subtract *numbers
#     # numbers.each { |num| @result -= num}
#     @result -= numbers.flatten.reduce(0, :+)
#     self
#   end
# end
# addition1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).answer
# addition2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).answer
# puts addition1
# puts addition2

class MathDojo
  attr_reader :answer

  def initialize
    @answer = 0
  end

  def add(*numbers)
    @answer += numbers.flatten.reduce(0, :+)
    self
  end

  def subtract(*numbers)
    @answer -= numbers.flatten.reduce(0, :+)
    self
  end
end

challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).answer
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).answer
puts challenge1
puts challenge2
