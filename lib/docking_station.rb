require_relative 'bike_container'

class DockingStation
  include BikeContainer

  DEFAULT_CAPACITY = 20

  def release_bike
    raise 'No bikes available' if empty?
    raise 'No working bike available' if all_broken?
    find_working_bike
  end

  def dock(bike)
    raise 'Docking station full' if full?
    bikes << bike
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def all_broken?
    bikes.none? { |bike| bike.working? }
  end

  def find_working_bike
    bikes.each_with_index { |bike, idx| return bikes.slice(idx) if bike.working? }
  end
end
