require_relative "../../lib/stati_stica/coefficient_of_determination"

module StatiStica
  describe CoefficientOfDetermination do
    describe "new" do
      context "when sample contains other than objects convertible to float" do
        it "raises an ArgumentError" do
          expect { StatiStica::CoefficientOfDetermination.new(dx: ['string',2,3], dy: [4,5,6]) }.to raise_error(ArgumentError)
        end
      end
      context "when samples have diferent sizes" do
        it "raises an ArgumentError" do
          expect { StatiStica::CoefficientOfDetermination.new(dx: [1,2], dy: [4,5,6]) }.to raise_error(ArgumentError)
        end
      end
    end
    describe "#value" do
      context "when sample contains only objects convertible to float" do
        it "returns the standard deviation of the passed series" do
          expect(StatiStica::CoefficientOfDetermination.new(dx: [1,3,2], dy: [4,5,6]).value).to eq(14.5)
        end

        it "returns the standard deviation as float" do
          expect(StatiStica::CoefficientOfDetermination.new(dx: [1,3,2], dy: [4,5,6]).value).to be_a(Float)
        end

         it "returns 1 when dy are all identical" do
          expect(StatiStica::CoefficientOfDetermination.new(dx: [1,3,2], dy: [4,4,4]).value).to eq(1)
        end
      end
    end
  end
end
