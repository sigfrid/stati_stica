require_relative "../../lib/stati_stica/mean"

module StatiStica
  describe Mean do
    describe "new" do
      context "when sample contains other than objects convertible to float" do
        it "raises an ArgumentError" do
          expect { StatiStica::Mean.new(['string',2,3]) }.to raise_error(ArgumentError)
        end
      end
      context "when sample is empty" do
        it "raises an ArgumentError" do
          expect { StatiStica::Mean.new([]) }.to raise_error(ArgumentError)
        end
      end
    end
    describe "#value" do
      context "when sample contains only objects convertible to float" do
        it "returns the mean of the passed array" do
          expect(StatiStica::Mean.new([1,2,3]).value).to eq(2)
        end

        it "returns the mean as float" do
          expect(StatiStica::Mean.new([1,2,3]).value).to be_a(Float)
        end
      end
    end
  end
end
