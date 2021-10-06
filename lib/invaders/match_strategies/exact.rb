module Invaders
  module MatchStrategies
    class Exact
      def initialize(a, b)
        @a = a
        @b = b
      end

      def compute
        a == b ? 1.0 : 0.0
      end

      private

      attr_reader :a, :b
    end
  end
end
