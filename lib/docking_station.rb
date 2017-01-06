class DockingStation
  attr_reader :bikes, :max_bikes

  def initialize
    @bikes = []
    @max_bikes = 20
  end

  def release_bike
    raise "No bikes in docking station." if @bikes.count == 0
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if (@bikes.count == 20)
    @bikes << bike
    bike
  end


end
