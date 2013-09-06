class Airport

  attr_accessor :planes, :bomb_alert

  def initialize (planes=[], bomb_alert = false)
    @planes = planes
    @bomb_alert = bomb_alert

  end

  def permit_take_off(plane)
    # return true if weather.is_sunny && !@bomb_alert
    # false
  end

  def permit_land(plane)
    # if weather.is_sunny && !@bomb_alert
    #     accept plane
    # else raise

  end






end