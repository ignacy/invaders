module Invaders
  module MatchStrategies
    class Lexical
      def initialize(a, b)
        @a = a
        @b = b
      end

      # For lexical match we count how many characters in a match those in b (on
      # the same positions) and we compare that to the total number of
      # characters in a
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
