module Invaders
  class Find
    def initialize
      @radar_reading = ::Invaders::RADAR_DATA
      @invaders = ::Invaders::KNOWN_INVADERS
    end

    def call
      invaders.each do |invader|
        (0...radar_reading.width).each do |x|
          (0..radar_reading.height).each do |y|
            slice = RadarSlice.new(
              radar_reading: radar_reading,
              x: x,
              y: y,
              width: invader.width,
              height: invader.height
            )

            next unless slice.valid?

            puts "Found! #{slice}, #{invader.rows}" if slice.matches?(invader)
          end
        end
      end
    end

    private

    attr_reader :radar_reading, :invaders
  end
end
