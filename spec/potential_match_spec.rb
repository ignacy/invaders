require 'spec_helper'

RSpec.describe ::Invaders::PotentialMatch do
  let(:radar) do
    ::Invaders::RadarReading.new(
      "aaaaaaaaaa\nbbbbbbbbbb\ncccccccccc\ndddddddddd"
    )
  end

  context 'validation ' do
    it 'knows when slice does not fit in the Radar' do
      invader = ::Invaders::Invader.new("aaa\naaa")
      slice = described_class.new(
        radar_reading: radar,
        lower_right_point: ::Invaders::Point.new(1, 1),
        invader: invader
      )

      expect(slice).to_not be_valid
    end

    it 'knows that a slice fits the Radar' do
      invader = ::Invaders::Invader.new("aa\naa")
      slice = described_class.new(
        radar_reading: radar,
        lower_right_point: ::Invaders::Point.new(3, 3),
        invader: invader
      )

      expect(slice).to be_valid
    end

    it 'knows when x is outside of the bounds of the Radar Reading' do
      invader = ::Invaders::Invader.new("aa\naa")
      slice = described_class.new(
        radar_reading: radar,
        lower_right_point: ::Invaders::Point.new(1000, 3),
        invader: invader
      )

      expect(slice).to_not be_valid
    end

    it 'knows when y is outside of the bounds of the Radar Reading' do
      invader = ::Invaders::Invader.new("aa\naa")
      slice = described_class.new(
        radar_reading: radar,
        lower_right_point: ::Invaders::Point.new(3, 1000),
        invader: invader
      )

      expect(slice).to_not be_valid
    end
  end

  context 'matching invaders' do
    it 'knows that it matched the invader' do
      invader = ::Invaders::Invader.new("aa\nbb")
      slice = described_class.new(
        radar_reading: radar,
        lower_right_point: ::Invaders::Point.new(1, 1),
        invader: invader
      )

      expect(slice.matches?).to eq(true)
    end

    it 'knows that it does not match the invader' do
      invader = ::Invaders::Invader.new("xx\nyy")
      slice = described_class.new(
        radar_reading: radar,
        lower_right_point: ::Invaders::Point.new(1, 1),
        invader: invader
      )
      expect(slice.matches?).to eq(false)
    end
  end
end
