module StatiStica
  class LinearRegression
    require_relative "t_distribution"
    require_relative "mean"

    def initialize(dx:, dy: nil)
      if dx.all? {|x| x.class == Array}
        @number_of_series = dx.size
        @series_size = dx.first.size
      else
        @number_of_series = 1
        @series_size = dx.size
      end

      dy,dx = dx,axis unless dy
      raise ArgumentError unless dx.size == dy.size

      @dx = dx
      @dy = dy.flatten

      sxx = sxy = sx = sy = 0
      
      dx.flatten.zip(dy.flatten).each do |x,y|
        sxy += x * y 
        sxx += x ** 2
        sx  += x
        sy  += y
      end

      @slope  = Float(( dx.size * sxy - sx * sy ) / ( dx.size * sxx - sx * sx ))
      @offset = Float((sy - @slope * sx) / dx.size)
    end

    def slope
      @slope
    end

    def offset
      @offset
    end

    def fit
      @dx.map{ |value| predict(value) }
    end

    def standard_error
      raise ArgumentError unless @series_size > 2

      sum_y = @dy.zip(self.fit).map{ |y, fit| (fit - y) **2 }.inject(0, &:+)
      Math.sqrt(sum_y / (@series_size - 2))
    end

    def lower_confidence_bound(x, probability, error = standard_error)
      bounds = Array(x).each_with_object(Array.new) do |x, bounds|
        bounds << predict(x) - confidence_level_at(x, probability, error)
      end

      bounds.one? ? bounds.first : bounds
    end

    def upper_confidence_bound(x, probability, error = standard_error)
      bounds = Array(x).each_with_object(Array.new) do |x, bounds|
        bounds << predict(x) + confidence_level_at(x, probability, error)
      end

      bounds.one? ? bounds.first : bounds
    end

    def confidence_bounds(x, probability, error = standard_error)
      bounds = Array(x).each_with_object(Array.new) do |x, bounds|
        bounds << [lower_confidence_bound(x, probability, error), upper_confidence_bound(x, probability, error)]
      end

      bounds.one? ? bounds.first : bounds
    end

    private

    def axis
      (0...@series_size).to_a * @number_of_series
    end

    def predict(x)
      @slope * x + @offset
    end

    def confidence_level_at(x, probability, error = standard_error)
      raise ArgumentError unless @series_size > 2
      
      TDistribution.value_for(probability, degree_of_freedom) * error * last(x)
    end

    def last(x)
      mean = StatiStica::Mean.new(@dx).value
      
      diff_from_mean_square = (x - mean) **2
      sum_squares_deviations = @dx.map{ |x| (x - mean) **2 }.inject(0, &:+)
      Math.sqrt((1.0 / @series_size) + (diff_from_mean_square / sum_squares_deviations))
    end

    def degree_of_freedom 
      (@series_size - 2) * @number_of_series
    end
  end
end
