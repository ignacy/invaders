module Invaders
  class Invader
    def initialize(string)
      raise ArgumentError, 'string cannot be empty' if string.nil? || string == ''

      @rows = string.split("\n")
    end

    attr_reader :rows

    def width
      @width ||= rows.first.size
    end

    def height
      @height ||= rows.size
    end
  end
end
