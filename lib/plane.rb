class Plane
  
  attr_reader :name   

  def initialize(name)
    @name = name
  end

  def take_off_from airport
    airport.take_off self
  end

  def land_at airport
    airport.land self
  end

end