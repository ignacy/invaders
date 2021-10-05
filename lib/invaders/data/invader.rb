module Invaders
  class Invader
    def initialize(string)
      raise ArgumentError, 'string cannot be empty' if string.nil? || string == ''

      @rows = string.chomp.split("\n")
    end

    attr_reader :rows

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
