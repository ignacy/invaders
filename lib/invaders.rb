# frozen_string_literal: true

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.collapse("#{__dir__}/invaders/data")
loader.setup

module Invaders
  KNOWN_INVADERS = [
    Invader.new("--o-----o--
---o---o---
--ooooooo--
-oo-ooo-oo-
ooooooooooo
o-ooooooo-o
o-o-----o-o
---oo-oo---"),
    Invader.new("---oo---
--oooo--
-oooooo-
oo-oo-oo
oooooooo
--o--o--
-o-oo-o-
o-o--o-o")
  ].freeze

  RADAR_DATA = RadarReading.new(File.read('radar_data'))

  Point = Struct.new(:x, :y) do
    def inside_area?(bottom_x, bottom_y, width, height)
      x >= (bottom_x - width) &&
        x <= bottom_x &&
        y >= (bottom_y - height) &&
        y <= bottom_y
    end
  end
end

loader.eager_load
