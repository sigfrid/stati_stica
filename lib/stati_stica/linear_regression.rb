module StatiStica
  class LinearRegression
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


    private

    def axis
      (0...@series_size).to_a * @number_of_series
    end

    def predict(x)
      @slope * x + @offset
    end
  end
end
