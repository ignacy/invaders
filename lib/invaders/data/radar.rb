module Invaders
  class Radar
    def initialize(data)
      raise ArgumentError, 'data cannot be empty' if data.nil? || data == ''

      @data = data
    end

    attr_reader :data
  end
end
