class Plane
    

  def take_off? (airport)
    airport.permission_given?
  end

  def land?(airport)
    airport.permission_given? 
  end

end