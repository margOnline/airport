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

  def permission_given?(plane)
    raise 'Permission denied due to security alert' if bomb_alert?
    raise 'Permission denied  - airport full' if full?
    raise 'Permission denied - poor weather conditions' if @weather.is_stormy?
  end

  def land(plane)
    planes = @planes.push(plane)if permission_given?(plane)
  end

  def take_off(plane)
    planes = @planes.pop if permission_given?(plane)
  end

end