class Plane
    

  def take_off? (airport)
    airport.permission_given_to_take_off?
  end

  def land?(airport)
    airport.permission_given_to_land? 
  end

end