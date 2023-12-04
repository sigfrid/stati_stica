module StatiStica
  module PCA
    class Cp
      def initialize(lsl:, usl:, sd:)
        @lsl = Float(lsl)
        @usl = Float(usl)
        @sd = Float(sd)
      end

      def value
        ((@usl - @lsl) / (6 * @sd)).abs
      end
    end
  end
end
