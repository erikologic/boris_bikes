require 'docking_station'
require 'bike'
require 'pry'
require 'pry-byebug'

describe DockingStation do
#create a new instance of bike


  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:bikes)}
  it { is_expected.to respond_to(:dock).with(1).argument}

  describe "#initialize(capacity = DEFAULT)" do
    context "when creating a new object" do
      it "object can be created without parameters" do
        expect(DockingStation.new.class).to eq(DockingStation)
      end
      it "object can be created with a given capacity on first parameter" do
        expect(DockingStation.new(35).class).to eq(DockingStation)
      end
    end
  end

  describe "#bikes" do
    before do
      @bike1 = Bike.new
      @bike2 = Bike.new
      subject.dock(@bike1)
      subject.dock(@bike2)
    end

    it 'returns the array of docked Bike objects' do
      expect(subject.bikes).to eq([@bike1, @bike2])
    end
  end

  describe "#release_bike" do
    context 'when DockingStation is empty' do
      it 'does not release a Bike object if dock is empty' do
        expect {subject.release_bike}.to raise_error("No bikes in docking station.")
      end
    end

    context 'when DockingStation has 1+ bike(s)' do
      before do
        @bike = Bike.new
        subject.dock(@bike)
      end

      it 'releases a Bike object' do
        expect(subject.release_bike).to eq @bike
      end
      it 'is returning a Bike object which is working' do
        expect(subject.release_bike.working?).to eq true
      end
    end

  end

  describe "#dock(bike)" do
    before do
      @bike = Bike.new
    end

    context 'when DockingStation is not full' do
      it 'can dock a Bike object' do
        expect(subject.dock(@bike)).to eq @bike
      end
    end

    context 'when docking station is full' do
      before do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      end
      it 'raises an error' do
        expect {subject.dock(Bike.new)}.to raise_error("Docking station is full")
      end
    end

    context "when a docking station object is created with a given capacity"  do
      before do
        @capacity = 5
        @obj_with_capacity = DockingStation.new(@capacity)
        @capacity.times { @obj_with_capacity.dock(Bike.new) }
      end
      it "will not let dock more bike than capacity" do
        expect {@obj_with_capacity.dock(Bike.new)}.to raise_error("Docking station is full")
      end
    end

  end



end
