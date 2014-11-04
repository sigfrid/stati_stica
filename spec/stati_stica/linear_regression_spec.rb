require_relative "../../lib/stati_stica/linear_regression"

module StatiStica
  describe LinearRegression do
    describe "new" do
      context "when two arguments have different sizes" do
        it "raises an ArgumentError" do
         expect { StatiStica::LinearRegression.new(dx: [1,2,3], dy: [4,5]) }.to raise_error(ArgumentError)
        end
      end

      context "when single series is passed as argument" do
        it "calculates slope of the regression line" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2]).slope).to eq(1)
        end
         it "calculates slope as float" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2]).slope).to be_a(Float)
        end
        it "calculates offset of the regression line" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2]).offset).to eq(0)
        end
         it "calculates offset as float" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2]).offset).to be_a(Float)
        end
      end
      
      context "when two series are passed as arguments" do
        it "calculates slope of the regression line" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2], dy: [3,4,5]).slope).to eq(1)
        end
         it "calculates slope as float" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2], dy: [3,4,5]).slope).to be_a(Float)
        end
        it "calculates offset of the regression line" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2], dy: [3,4,5]).offset).to eq(3)
        end
         it "calculates offset as float" do
          expect(StatiStica::LinearRegression.new(dx: [0,1,2], dy: [3,4,5]).offset).to be_a(Float)
        end
      end
    end

    describe "#fit" do
      context "when single series is passed as argument" do
        it "calculates the line's value for at the points passed as argument" do
          expect(StatiStica::LinearRegression.new(dx: [1,3,2]).fit).to eq([2,2,2])
        end
      end

      context "when two series are passed as arguments" do
        it "calculates the line's value for at the points passed as argument" do
          expect(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).fit).to eq([5,5,5])
        end
      end
    end
  end
end

