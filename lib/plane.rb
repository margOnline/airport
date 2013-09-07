class Plane
  
  attr_reader :name 
  

  def initialize(name)
    @name = name   
  end 

  def take_off? (airport)
    airport.permission_given_to_take_off?
  end

  def land?(airport)
    airport.permission_given_to_land? 
  end

end