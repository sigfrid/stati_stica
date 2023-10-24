require_relative "../../../lib/stati_stica/pca/cpk"

module StatiStica
  module PCA
    describe Cpk do
      describe "new" do
        context "paramaters contains other than objects convertible to float" do
          it "raises an ArgumentError" do
            expect { StatiStica::PCA::Cpk.new(lsl: 1, usl: 1, mean: 1, sd: "2x") }.to raise_error(ArgumentError)
          end
        end
        context "when a paramater is misssing" do
          it "raises an ArgumentError" do
            expect { StatiStica::PCA::Cpk.new(lsl: 1, usl: 2, mean: 3) }.to raise_error(ArgumentError)
            expect { StatiStica::PCA::Cpk.new(lsl: 1, usl: 2, sd: 3) }.to raise_error(ArgumentError)
            expect { StatiStica::PCA::Cpk.new(lsl: 1, mean: 2, sd: 3) }.to raise_error(ArgumentError)
            expect { StatiStica::PCA::Cpk.new(usl: 1, mean: 2, sd: 3) }.to raise_error(ArgumentError)
          end
        end
      end
      describe "#value" do
        context "when parameters contains only objects convertible to float" do
          it "returns the ratio between distance from the mean to nearest specification limit
              and the distance from the mean to the process edge" do
            # 24 - 9 / 3 * 2 = 15 / 6 = 2.5
            # 9 - 0 / 3 * 2  = 9 / 6 = 1.5
            # min(2.5, 1.5) = 1.5
            expect(StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9, sd: 2).value).to eq(1.5)
          end

          it "returns the index as float" do
            expect(StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9, sd: 2).value).to be_a(Float)
          end
        end
        context "when standard deviation is zero" do
          it "returns Infinity" do
            expect(StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9, sd: 0).value).to eq(Float::INFINITY)
          end
        end
      end
    end
  end
end
