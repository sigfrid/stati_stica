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
        it "calculates the line's value for the points passed as argument" do
          expect(StatiStica::LinearRegression.new(dx: [1,3,2]).fit).to eq([2,2,2])
        end
      end

      context "when two series are passed as arguments" do
        it "calculates the line's value for the points passed as argument" do
          expect(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).fit).to eq([5,5,5])
        end
      end
    end

    describe '#standard_error' do
      context "when series does not have at least 3 values" do
        it "raises an ArgumentError" do
         expect { StatiStica::LinearRegression.new(dx: [1,2], dy: [4,5]).standard_error }.to raise_error(ArgumentError)
        end
      end

      context "when series have at least 3 values" do
        it "calculates standard_error of the estimate" do
         expect(truncated(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).standard_error)).to eq(truncated(1.4142135623730951))
        end

        it "calculates standard_error as float" do
         expect(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).standard_error).to be_a(Float)
        end
      end
    end

    describe '#lower_confidence_bound' do
      context "when series does not have at least 3 values" do
        it "raises an ArgumentError" do
         expect { StatiStica::LinearRegression.new(dx: [1,2], dy: [4,5]).lower_confidence_bound(1, 95) }.to raise_error(ArgumentError)
        end
      end

      context "when series have at least 3 values" do
        it "calculates lower confidence bound" do
         expect(truncated(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).lower_confidence_bound(1, 95))).to eq(truncated(-11.4040209628615))
        end

        it "returns lower confidence bound for a single point as float" do
         expect(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).lower_confidence_bound(1, 95)).to be_a(Float)
        end

        it "returns lower confidence bound for multiple points as an array of floats" do
          lower_confidence_bound = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).lower_confidence_bound([1,2,3], 95)
          expect(lower_confidence_bound).to be_a(Array)
          expect(lower_confidence_bound.count).to eq(3)
          expect(lower_confidence_bound[0]).to be_a(Float)
          expect(lower_confidence_bound[1]).to be_a(Float)
          expect(lower_confidence_bound[2]).to be_a(Float)
        end
      end
    end

    describe '#upper_confidence_bound' do
      context "when series does not have at least 3 values" do
        it "raises an ArgumentError" do
         expect { StatiStica::LinearRegression.new(dx: [1,2], dy: [4,5]).upper_confidence_bound(1, 95) }.to raise_error(ArgumentError)
        end
      end

      context "when series have at least 3 values" do
        it "calculates upper confidence bound" do
         expect(truncated(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).upper_confidence_bound(1, 95))).to eq(truncated(21.4040209628615))
        end

        it "returns upper confidence bound for a single point as float" do
         expect(StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).upper_confidence_bound(1, 95)).to be_a(Float)
        end

        it "returns upper confidence bound for multiple points as an array of floats" do
          upper_confidence_bound = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).upper_confidence_bound([1,2,3], 95)
          expect(upper_confidence_bound).to be_a(Array)
          expect(upper_confidence_bound.count).to eq(3)
          expect(upper_confidence_bound[0]).to be_a(Float)
          expect(upper_confidence_bound[1]).to be_a(Float)
          expect(upper_confidence_bound[2]).to be_a(Float)
        end
      end
    end

    describe '#confidence_bounds' do
      context "when series does not have at least 3 values" do
        it "raises an ArgumentError" do
         expect { StatiStica::LinearRegression.new(dx: [1,2], dy: [4,5]).confidence_bounds(1, 95) }.to raise_error(ArgumentError)
        end
      end

      context "when series have at least 3 values" do
        it "calculates confidence bounds" do
          confidence_bounds = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).confidence_bounds(1, 95)
         expect([truncated(confidence_bounds[0]), truncated(confidence_bounds[1])]).to eq([truncated(-11.4040209628615),truncated(21.4040209628615)])
        end

        it "returns confidence bounds for a single point as an array of floats" do
         confidence_bounds = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).confidence_bounds(1, 95)
          expect(confidence_bounds).to be_a(Array)
          expect(confidence_bounds.count).to eq(2)
          expect(confidence_bounds[0]).to be_a(Float)
          expect(confidence_bounds[1]).to be_a(Float)
        end

        it "returns confidence bounds for multiple points as an array of arrays" do
          confidence_bounds = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6]).confidence_bounds([1,2,3], 95)
          expect(confidence_bounds).to be_a(Array)
          expect(confidence_bounds.count).to eq(3)
          expect(confidence_bounds[0]).to be_a(Array)
          expect(confidence_bounds[0].count).to eq(2)
          expect(confidence_bounds[0][0]).to be_a(Float)
          expect(confidence_bounds[0][1]).to be_a(Float)
          expect(confidence_bounds[1]).to be_a(Array)
          expect(confidence_bounds[1].count).to eq(2)
          expect(confidence_bounds[1][0]).to be_a(Float)
          expect(confidence_bounds[1][1]).to be_a(Float)
          expect(confidence_bounds[2]).to be_a(Array)
          expect(confidence_bounds[2].count).to eq(2)
          expect(confidence_bounds[2][0]).to be_a(Float)
          expect(confidence_bounds[2][1]).to be_a(Float)
        end
      end
    end
  end
end

