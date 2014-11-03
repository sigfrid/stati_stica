module StatiStica
  class StandardDeviation
    require_relative 'mean'

    def initialize(sample)
      raise ArgumentError if sample.empty?
      @sample = sample.map { |s| Float(s) }
    end

    def value
      mean = StatiStica::Mean.new(@sample).value
      variance = @sample.inject(0) { |sum, element| sum + (element - mean) ** 2 } / @sample.size
      Math.sqrt(variance)
    end
  end
end