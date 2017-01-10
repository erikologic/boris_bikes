require 'bike'

describe Bike do
  it { is_expected.to respond_to(:broken?) }

  context "when set to not working" do
    before do
      subject.report_broken
    end
    it "report itself as not working" do
      expect(subject.broken?).to eq(true)
    end
  end
end
