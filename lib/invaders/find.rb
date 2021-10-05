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

            next unless slice.matches?(invader)

            puts "Found possible invader! Match level: #{slice.match_level(invader)}"
            puts "== Invader: ==\n"
            puts invader.rows
            puts "== Slice: ==\n"

            puts slice.rows

            puts "========"
          end
        end
      end
    end

    private

    attr_reader :radar_reading, :invaders
  end
end
