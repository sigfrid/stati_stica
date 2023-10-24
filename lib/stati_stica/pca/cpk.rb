module StatiStica
  module PCA
    class Cpk
      def initialize(lsl:, usl:, mean:, sd:)
        @usl = Float(usl)
        @lsl = Float(lsl)
        @mean = Float(mean)
        @sd = Float(sd)
      end

      def value
        [(@usl - @mean) / (3 * @sd), (@mean - @lsl) / (3 * @sd)].min.abs
      end
    end
  end
end
