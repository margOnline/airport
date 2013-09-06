require 'weather'

class Airport

  attr_accessor :planes, :bomb_alert

  def initialize (max_capacity, planes=[], bomb_alert = false)
    @planes = planes
    @bomb_alert = bomb_alert
    @weather = Weather.new
    @max_capacity = max_capacity

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

  def full?
    !has_capacity?
  end

  def give_permission?(plane)
    weather.is_sunny? && !bomb_alert?
  end

  def land(plane)
    raise 'Permission denied due to security alert' if bomb_alert?
    raise 'Permission denied  - airport full' if full?
    raise 'Permission denied - poor weather conditions' if weather.weather_is_stormy?
    planes = planes.push(plane)
  end

end