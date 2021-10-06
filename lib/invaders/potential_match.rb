require 'forwardable'

module Invaders
  class PotentialMatch
    THRESHOLD = 0.8
    extend Forwardable
    def_delegators :@lower_right_point, :x, :y
    def_delegators :@invader, :width, :height

    def initialize(radar_reading:, invader:, lower_right_point:, match_strategy: MatchStrategies::Lexical, threshold: THRESHOLD)
      @radar_reading = radar_reading
      @invader = invader
      @lower_right_point = lower_right_point
      @match_strategy = match_strategy
      @threshold = threshold
    end

    attr_reader :invader

    # A potential match is valid when it is contained in the RadarReading.
    # For example if the Radar gives the following reading:
    # ~~~
    # abcd
    # abcd
    # abcd
    # ~~
    #
    # Potential match x = 1, y = 1, width = 2, height = 2 would be valid and represent:
    # ~~
    # ab
    # ab
    # ~~
    #
    # Potential match x = 1, y = 1, widht = 2, height = 3 would not be valid
    def valid?
      return false if x >= radar_reading.width || x.negative?
      return false if y >= radar_reading.height || y.negative?

      (x + 1) - width >= 0 && (y + 1) - height >= 0
    end

    def good_enough?
      return false unless valid?

      match_level >= threshold
    end

    # Returns the view of the RadarReading rows as narrowed by this potential match
    def rows
      @rows ||= radar_reading.rows[(y + 1 - height)..y].map do |row|
        row[(x + 1 - width)..x]
      end
    end

    def match_level
      @match_level ||= match_strategy.new(invader.rows_string, rows_string).compute
    end

    private

    def rows_string
      @rows_string ||= rows.join
    end

    attr_reader :radar_reading, :match_strategy, :threshold
  end
end
