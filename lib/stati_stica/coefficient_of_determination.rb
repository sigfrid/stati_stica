module StatiStica
  class CoefficientOfDetermination
    require_relative 'mean'

    def initialize(dx:, dy:)
      raise ArgumentError unless dx.size == dy.size
      
      @dx = dx.map { |x| Float(x) }
      @dy = dy.map { |y| Float(y) }
    end

    def value
      mean = StatiStica::Mean.new(@dy).value

      #if mean < 1
      #  dy = dy.collect {|y| y*1000}
      #  dx = dx.collect {|x| x*1000}
      #end
      
      ess = @dx.map{ |x| (x - mean) **2 }.inject(0, &:+)
      tss = @dy.map{ |y| (y - mean) **2 }.inject(0, &:+)

      ratio = ess / tss
      (ratio.nan? || ratio.infinite?) ? 1 : ratio
    end
  end
end
