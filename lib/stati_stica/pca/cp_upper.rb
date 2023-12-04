module StatiStica
  module PCA
    class CpUpper
      def initialize(usl:, mean:, sd:)
        @usl = Float(usl)
        @mean = Float(mean)
        @sd = Float(sd)
      end

      def value
        ((@usl - @mean) / (3 * @sd)).abs
      end
    end
  end
end
