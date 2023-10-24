module StatiStica
  module PCA
    class Cp
      def initialize(lsl:, usl:, sd:)
        @usl = Float(usl)
        @lsl = Float(lsl)
        @sd = Float(sd)
      end

      def value
        ((@usl - @lsl) / (6 * @sd)).abs
      end
    end
  end
end
