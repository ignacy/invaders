require 'colorize'

module Invaders
  class Find
    def initialize
      @radar_reading = ::Invaders::RADAR_DATA
      @invaders = ::Invaders::KNOWN_INVADERS
    end

    def call
      matching_slices = []

      invaders.each do |invader|
        (0...radar_reading.width).each do |x|
          (0...radar_reading.height).each do |y|
            slice = PotentialMatch.new(
              radar_reading: radar_reading,
              lower_right_point: Point.new(x, y),
              invader: invader
            )

            if slice.matches?
              matching_slices << slice

              puts Presenters::InvaderMatchPresenter.new(
                     slice,
                     invader
                   )
            end
          end
        end
      end

      (0...radar_reading.height).each do |y|
        (0...radar_reading.width).each do |x|
          point = Point.new(x, y)
          matching_slice = matching_slices.detect { |slice| slice.inside?(point) }
          if matching_slice
            print radar_reading.rows[y][x].colorize(:green)
          else
            print radar_reading.rows[y][x]
          end
        end
        puts ""
      end
    end

    private

    attr_reader :radar_reading, :invaders
  end
end
