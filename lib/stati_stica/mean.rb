module StatiStica
  class Mean
    def initialize(sample)
      raise ArgumentError if sample.empty?
      @sample = sample.map { |s| Float(s) }
    end

    def value
      @sample.inject{ |sum, el| sum + el }.to_f / @sample.size
    end
  end
end
