module Invaders
  module MatchStrategies
    class Lexical
      def initialize(a, b)
        @a = a
        @b = b
      end

      def compute
        matches_count.to_f / a.size
      end

      private

      def matches_count
        a.chars.each_with_index.inject(0) do |count, (char, index)|
          count += 1 if b[index] == char
          count
        end
      end

      attr_reader :a, :b
    end
  end
end
