class Weather

  attr_accessor :condition

  def inititalize
    @conditions = ['sunny', 'stormy']
    @condition = @conditions.sample 
  end


  def is_sunny?
    @condition == 'sunny'
  end

  def is_stormy?
    !is_sunny?
  end

  def change!
    @condition == @conditions[0] ? @conditions[1] : @conditions[0]
    
  end

end