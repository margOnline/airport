require_relative 'weather'
require_relative 'runway'

class Airport

  attr_accessor :planes, :bomb_alert, :weather, :runway
  attr_reader :name

  def initialize (name, max_capacity, planes=[], bomb_alert = false)
    @name = name
    @planes = planes
    @bomb_alert = bomb_alert
    @weather = Weather.new
    @max_capacity = max_capacity
    @runway = Runway.new('1')
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
  
  def is_stormy?
    !is_sunny?
  end

  def is_sunny?
    weather.condition == 'sunny'
  end

  def permission_given_to_land?
    landing_denied = []
    landing_denied << 'security alert' if bomb_alert?
    landing_denied << 'airport full' if full?
    landing_denied << 'poor weather conditions' if is_stormy?
    landing_denied.none?
  end

  def permission_given_to_take_off?
    take_off_denied = []
    take_off_denied << 'security alert' if bomb_alert?
    take_off_denied << 'no planes in the airport' if no_planes?
    take_off_denied << 'poor weather conditions' if is_stormy?
    take_off_denied.none?
  end

  def land(plane)
    @planes.push(plane) if permission_given_to_land?
  end

  def take_off(plane)
    @planes.delete(plane) if permission_given_to_take_off?
  end

end