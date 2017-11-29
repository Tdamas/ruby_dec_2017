class Project
  @name
  @description

  attr_accessor :name, :description

  def initialize(name, description)
  	@name = name
  	@description = description
  end

  def elevator_pitch
  	puts @name, @description
  end
  
  def self.about
  	puts "this is a project"	


end


lab = Project.new("lab", "diagnostic laboratory")


puts lab.elevator_pitch
puts Project.about

end