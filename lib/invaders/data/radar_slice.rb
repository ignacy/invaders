module Invaders
  # Given a Radar reading this class represents a slice of that reading.
  # Note: a slice might not be valid, it can for example be larger than
  # what the Radar reading represents.
  class RadarSlice
    def initialize(radar_reading:, x:, y:, width:, height:)
      @radar_reading = radar_reading
      @x = x
      @y = y
      @width = width
      @height = height
    end

    # A slice is valid when it is contained in the RadarReading.
    # For example if the Radar gives the following reading:
    # ~~~
    # abcd
    # abcd
    # abcd
    # ~~
    #
    # Slice x = 1, y = 1, width = 2, height = 2 would be valid and represent:
    # ~~
    # ab
    # ab
    # ~~
    #
    # Slice x = 1, y = 1, widht = 2, height = 3 would not be valid
    def valid?
      return false if x >= radar_reading.width || x.negative?
      return false if y >= radar_reading.height || y.negative?

      (x + 1) - width >= 0 && (y + 1) - height >= 0
    end

    def matches?(invader)
      return false unless invader.width == width
      return false unless invader.height == height

      invader.rows.join("\n") == rows.join("\n")
    end

    private

    def rows
      return [] unless valid?

      radar_reading.rows[(y + 1 - height)..y].map do |row|
        row[(x + 1 - width)..x]
      end
    end

    attr_reader :radar_reading, :x, :y, :width, :height
  end
end