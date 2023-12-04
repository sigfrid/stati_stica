require_relative "../../../lib/stati_stica/pca/cp"

module StatiStica
  module PCA
    describe Cp do
      describe "new" do
        context "paramaters contains other than objects convertible to float" do
          it "raises an ArgumentError" do
            expect { StatiStica::PCA::Cp.new(lsl: 1, usl: 1, sd: "2x") }.to raise_error(ArgumentError)
          end
        end
        context "when a paramater is misssing" do
          it "raises an ArgumentError" do
            expect { StatiStica::PCA::Cp.new(lsl: 1, usl: 2) }.to raise_error(ArgumentError)
            expect { StatiStica::PCA::Cp.new(usl: 1, sd: 2) }.to raise_error(ArgumentError)
            expect { StatiStica::PCA::Cp.new(lsl: 1, sd: 2) }.to raise_error(ArgumentError)
          end
        end
      end
      describe "#value" do
        context "when parameters contains only objects convertible to float" do
          it "returns the ratio between specification and process width" do
            # 24 - 0 / 6 * 2 = 24 / 12 = 2
            expect(StatiStica::PCA::Cp.new(lsl: 0, usl: 24, sd: 2).value).to eq(2)
          end

          it "returns the index as float" do
            expect(StatiStica::PCA::Cp.new(lsl: 0, usl: 24, sd: 2).value).to be_a(Float)
          end
        end
        context "when standard deviation is zero" do
          it "returns Infinity" do
            expect(StatiStica::PCA::Cp.new(lsl: 0, usl: 24, sd: 0).value).to eq(Float::INFINITY)
          end
        end
      end
    end
  end
end
