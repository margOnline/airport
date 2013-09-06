require 'weather'

class Airport

  attr_accessor :planes, :bomb_alert

  def initialize (planes=[], bomb_alert = false)
    @planes = planes
    @bomb_alert = bomb_alert
    @weather = Weather.new

  end

  def set weather
    @weather = weather.set
  end

  def bomb_alert?
    @bomb_alert
  end

  def bomb_alert!
    @bomb_alert = true
  end

  def clear_bomb_alert!
    @bomb_alert = false
  end

  def has_capacity?
    planes.length < @max_capacity
  end

  def give_permission?(plane)
    weather.is_sunny? && !bomb_alert?
  end

  def land(plane)
    if give_permission? && has_capacity?
      planes.push(plane)
    else
      raise 'Permission denied'
    end
  end

end