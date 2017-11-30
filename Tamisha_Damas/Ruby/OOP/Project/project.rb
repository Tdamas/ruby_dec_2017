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

project1 =Project.new("CodingDojo", "Software programming bootcamp")
project2 =Project.new("Tech Talent South", "Instructor")
project1.elevator_pitch
project2.elevator_pitch
