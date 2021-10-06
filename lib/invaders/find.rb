require 'colorize'

module Invaders
  class Find
    CONFIDENCE_LEVELS = {
      0.60 => :green,
      0.85 => :red
    }.freeze

    def initialize
      @radar_reading = ::Invaders::RADAR_DATA
      @invaders = ::Invaders::KNOWN_INVADERS
    end

    def call
      CONFIDENCE_LEVELS.each do |threshold, color|
        report_matching(threshold, color)
      end
    end

    def report_matching(threshold, color)
      matches = []

      invaders.each do |invader|
        (0...radar_reading.width).each do |x|
          (0...radar_reading.height).each do |y|
            potential_match = PotentialMatch.new(
              radar_reading: radar_reading,
              lower_right_point: Point.new(x, y),
              invader: invader,
              threshold: threshold
            )

            next unless potential_match.matches?

            matches << potential_match

            puts Presenters::InvaderMatchPresenter.new(
              potential_match,
              invader
            )
          end
        end
      end

      print_colorized_radar_reading(threshold, matches, color)
    end

    private

    def print_colorized_radar_reading(threshold, matches, color)
      return if matches.size.zero?

      print "Matches with score >= #{threshold}\n"
      (0...radar_reading.height).each do |y|
        (0...radar_reading.width).each do |x|
          point = Point.new(x, y)
          match = matches.detect { |potential_match| potential_match.inside?(point) }
          if match
            print radar_reading.rows[y][x].colorize(color)
          else
            print radar_reading.rows[y][x]
          end
        end
        puts
      end
      puts
    end

    attr_reader :radar_reading, :invaders
  end
end
