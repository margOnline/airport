class Weather

  attr_accessor :condition
  
  CONDITIONS = %w(sunny stormy)

  def inititalize
    @condition = set_weather  
  end

  def set_weather
    CONDITIONS.sample
  end

  def is_sunny?
    @condition == CONDITIONS[0]
  end

  def is_stormy?
    !is_sunny?
  end

  def change!
    @condition == CONDITIONS[0] ? CONDITIONS[1] : CONDITIONS[0]
    
  end

end