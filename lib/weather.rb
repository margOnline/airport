class Weather

  attr_reader :conditions, :condition

  def initialize(conditions = ['sunny','stormy'], condition = 'sunny')
    @conditions = conditions
  end

  def forecast
    @conditions.sample
  end

  def sunny!
    @condition = 'sunny'
  end

  def stormy!
    @condition = 'stormy'
  end

end