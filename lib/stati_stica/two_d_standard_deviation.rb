module StatiStica
  class TwoDStandardDeviation
    def initialize(dx:, dy:)
      raise ArgumentError unless dx.size == dy.size

      @dx = dx.map { |x| Float(x) }
      @dy = dy.map { |y| Float(y) }
    end

    def value
      sum = @dx.zip(@dy).map{ |x, y| (x - y) **2 }.inject(0, &:+)
      Math.sqrt(sum / @dx.size)
    end
  end
end
