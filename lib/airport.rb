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

  def no_planes?
    planes.length < 1
  end

  def permission_given_to_land?
    raise 'Permission denied due to security alert' if bomb_alert?
    raise 'Permission denied  - airport full' if full?
    raise 'Permission denied - poor weather conditions' if @weather.is_stormy?
    true
  end

  def permission_given_to_take_off?
    raise 'Permission denied due to security alert' if bomb_alert?
    raise 'Permission denied  - no planes to take off' if no_planes?
    raise 'Permission denied - poor weather conditions' if @weather.is_stormy?
    true
  end

  def land(plane)
    planes = @planes.push(plane) if permission_given_to_land?
  end

  def take_off(plane)
    @planes.delete(plane) if permission_given_to_take_off?
    planes
  end

end