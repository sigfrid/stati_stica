require_relative "../../lib/stati_stica/standard_deviation"

module StatiStica
  describe StandardDeviation do
    describe "new" do
      context "when sample contains other than objects convertible to float" do
        it "raises an ArgumentError" do
          expect { StatiStica::StandardDeviation.new(['string',2,3]) }.to raise_error(ArgumentError)
        end
      end
      context "when sample is empty" do
        it "raises an ArgumentError" do
          expect { StatiStica::StandardDeviation.new([]) }.to raise_error(ArgumentError)
        end
      end
    end
    describe "#value" do
      context "when sample contains only objects convertible to float" do
        it "returns the standard deviation of the passed array" do
          expect(StatiStica::StandardDeviation.new([2,4,4,4,5,5,7,9]).value).to eq(2)
        end

        it "returns the standard deviation as float" do
          expect(StatiStica::StandardDeviation.new([2,4,4,4,5,5,7,9]).value).to be_a(Float)
        end
      end
    end
  end
end
