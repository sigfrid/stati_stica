require_relative "../../lib/stati_stica/two_d_standard_deviation"

module StatiStica
  describe TwoDStandardDeviation do
    describe "new" do
      context "when sample contains other than objects convertible to float" do
        it "raises an ArgumentError" do
          expect { StatiStica::TwoDStandardDeviation.new(dx: ['string',2,3], dy: [4,5,6]) }.to raise_error(ArgumentError)
        end
      end
      context "when samples have diferent sizes" do
        it "raises an ArgumentError" do
          expect { StatiStica::TwoDStandardDeviation.new(dx: [1,2], dy: [4,5,6]) }.to raise_error(ArgumentError)
        end
      end
    end
    describe "#value" do
      context "when sample contains only objects convertible to float" do
        it "returns the standard deviation of the passed array" do
          expect(StatiStica::TwoDStandardDeviation.new(dx: [1,3,2], dy: [4,5,6]).value).to eq(3.1091263510296048)
        end

        it "returns the standard deviation as float" do
          expect(StatiStica::TwoDStandardDeviation.new(dx: [1,3,2], dy: [4,5,6]).value).to be_a(Float)
        end
      end
    end
  end
end
