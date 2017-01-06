require 'docking_station'
require 'bike'
require 'pry'
require 'pry-byebug'

describe DockingStation do
#create a new instance of bike


  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:bikes)}
  it { is_expected.to respond_to(:dock).with(1).argument}

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
    context 'when DockingStation is empty' do
      it 'does not release bike if dock is empty' do
        expect {subject.release_bike}.to raise_error("No bikes in docking station.")
      end
    end

    context 'when DockingStation has 1+ bike(s)' do
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
    end

  end

  describe "#dock(bike)" do
    before do
      @bike = Bike.new
    end

    context 'when DockingStation has 19- bike(s)' do
      it 'docks the bike' do
        expect(subject.dock(@bike)).to eq @bike
      end
    end

    context 'when docking station is full' do
      it 'raises an error' do
        DockingStation::DEFAULT_CAPACITY.times do
          subject.dock(Bike.new)
        end
      expect {subject.dock(Bike.new)}.to raise_error("Docking station is full")
      end
    end

  end



end
