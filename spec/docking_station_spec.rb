require 'docking_station'
require 'bike'
require 'pry'
require 'pry-byebug'

describe DockingStation do
#create a new instance of bike
  it 'subject responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'subject responds to .bikes' do
    expect(subject).to respond_to :bikes
  end

  it 'subject responding to dock with 1 argument' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  describe "#bikes" do
    before do
      @bike1 = Bike.new
      @bike2 = Bike.new
      subject.dock(@bike1)
      subject.dock(@bike2)
    end

    it 'returns the array of docked bikes' do
      expect(subject.bikes).to eq([@bike1, @bike2])
    end
  end

  describe "#release_bike" do
    before do
      @bike = Bike.new
      subject.dock(@bike)
    end

    it 'releases a working bike' do
      expect(subject.release_bike).to eq @bike
    end
    it 'expects bike to be working' do
      expect(subject.release_bike.working?).to eq true
    end
    it 'does not release bike if dock is empty' do
      subject.release_bike
      expect {subject.release_bike}.to raise_error("No bikes in docking station.")
    end

  end

  describe "#dock(bike)" do
    before do
      @bike = Bike.new
    end

    #walkthrough
      it 'docks the bike' do
        expect(subject.dock(@bike)).to eq @bike
      end
      #walkthrough
      it 'raises an error when docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times do
          subject.dock(Bike.new)
        end
      expect {subject.dock(Bike.new)}.to raise_error("Docking station is full")
      end

  end



end
