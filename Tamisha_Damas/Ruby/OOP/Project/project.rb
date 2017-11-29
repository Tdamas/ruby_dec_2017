class Project

  attr_accessor :name, :description
  def initialize name, description
      @name = name
      @description = description
  end
  def elevator_pitch
    puts " #{@name}, #{@description}"
  end
end

project1 = Project.new("CodingDojo", "Software programming bootcamp")
project1.elevator_pitch
