module Invaders
  # Represents a single Radar reading
  class RadarReading
    def initialize(data)
      raise ArgumentError, 'data cannot be empty' if data.nil? || data == ''

      @data = data
      @rows = data.split("\n")
    end

    attr_reader :rows

    def height
      @height ||= rows.size
    end

    def width
      @width ||= rows.first.size
    end
  end
end
