module StatiStica
  module PCA
    class CpLower
      def initialize(lsl:, mean:, sd:)
        @lsl = Float(lsl)
        @mean = Float(mean)
        @sd = Float(sd)
      end

      def value
        ((@mean - @lsl) / (3 * @sd)).abs
      end
    end
  end
end
