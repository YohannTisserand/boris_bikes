require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bike available' if empty?

    @bike.pop
  end

  def dock(bike)
    raise 'Docking station full' if full?

    @bike << bike
  end

  private

  def full?
    @bike.count >= capacity
  end

  def empty?
    @bike.empty?
  end
end
