class DockingStation
  attr_reader :bike


  def release_bike
    raise "No bikes in docking station." unless @bike
    @bike
  end


  def dock(bike)
    raise "Docking station is full" if @bike
    @bike = bike
  end


end
