class DockingStation
  attr_reader :bikes, :max_bikes

  def initialize
    @bikes = []
    @max_bikes = 20
  end

  def release_bike
    raise "No bikes in docking station." if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
    bike
  end

  private

  def full?
    (@bikes.count == 20) ? true : false
  end

  def empty?
    @bikes.count == 0 ? true : false
  end
end
