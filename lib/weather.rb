class Weather

  attr_reader :conditions

  def initialize(conditions)
    @conditions = conditions
  end

  def forecast
    @conditions.sample
  end

end