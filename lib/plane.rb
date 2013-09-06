class Plane


  def initialize

  end
    

  def take_off? (airport)
    return true if airport.permission_given?
    false
  end

  def land?(airport)
    return true if airport.permission_given? 
    false
  end




end