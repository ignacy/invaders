module Invaders
  class Invader
    def initialize(string)
      raise ArgumentError, 'string cannot be empty' if string.nil? || string == ''

      @string = string
    end

    def to_a
      string.split("\n")
    end

    private

    attr_reader :string
  end
end
