class Van
  def initialize
    @bikes = []
  end

  def take(bikes)
    @bikes = bikes
  end

  def deliver
    @bikes
  end
end