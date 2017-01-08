# require 'docking_station'
# require 'bike'
require 'van'
require 'pry'
require 'pry-byebug'

describe Van do
  it { is_expected.to respond_to(:take).with(1).argument }
  it { is_expected.to respond_to(:deliver).with(0).argument }

  before do
    @bike1 = double(:bike)
    @bike2 = double(:bike)
    @bike_arr = [@bike1, @bike1]
  end

  describe "#take" do
    it "can collect bikes returning the collected bikes" do
      expect(subject.take(@bike_arr)).to eq(@bike_arr)
    end
  end
  
  context "when bikes have not been collected" do
    describe "#deliver" do
      it "return nil instead of bikes" do
      end
    end  
  end
  context "when bikes have been collected" do
    before do
      subject.take(@bike_arr)
    end
    describe "#deliver" do
      it "return collected bikes" do
        expect(subject.deliver).to eq(@bike_arr)        
      end
    end  
  end

end