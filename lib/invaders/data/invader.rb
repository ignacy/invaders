module Invaders
  class Invader
    SENSIBLE_COLORS = %i[red green blue light_blue].freeze

    def initialize(string)
      raise ArgumentError, 'string cannot be empty' if string.nil? || string == ''

      @rows = string.chomp.split("\n")
      @color = SENSIBLE_COLORS.sample
    end

    attr_reader :rows, :color

    def width
      @width ||= rows.first.size
    end

    def height
      @height ||= rows.size
    end

    def rows_string
      @rows_string ||= rows.join
    end
  end
end
