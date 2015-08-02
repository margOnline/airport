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
    planes.none?
  end

  def permission_given_to_land?
    airport_safe? && has_capacity?
  end

  def permission_given_to_take_off?
    airport_safe? && !no_planes?
  end

  def land(plane)
    @planes.push(plane) if permission_given_to_land?
  end

  def take_off(plane)
    @planes.delete(plane) if permission_given_to_take_off?
  end

  private
  def is_sunny?
    weather.condition == 'sunny'
  end
  def is_stormy?
    !is_sunny?
  end

  def airport_safe?
    !bomb_alert && is_sunny?
  end

end