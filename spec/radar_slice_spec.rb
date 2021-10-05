require 'spec_helper'

RSpec.describe ::Invaders::RadarSlice do
  let(:radar) do
    ::Invaders::RadarReading.new(
      "aaaaaaaaaa\nbbbbbbbbbb\ncccccccccc\ndddddddddd"
    )
  end

  context 'validation ' do
    it 'knows when slice does not fit in the Radar' do
      slice = described_class.new(
        radar_reading: radar,
        x: 1,
        y: 1,
        width: 3,
        height: 2
      )

      expect(slice).to_not be_valid
    end

    it 'knows that a slice fits the Radar' do
      slice = described_class.new(
        radar_reading: radar,
        x: 3,
        y: 3,
        width: 2,
        height: 2
      )

      expect(slice).to be_valid
    end

    it 'knows when x is outside of the bounds of the Radar Reading' do
      slice = described_class.new(
        radar_reading: radar,
        x: 1000,
        y: 3,
        width: 2,
        height: 2
      )

      expect(slice).to_not be_valid
    end

    it 'knows when y is outside of the bounds of the Radar Reading' do
      slice = described_class.new(
        radar_reading: radar,
        x: 3,
        y: 100_000,
        width: 2,
        height: 2
      )

      expect(slice).to_not be_valid
    end
  end

  context 'matching invaders' do
    let(:invader) { ::Invaders::Invader.new("aa\nbb") }
    let(:slice) do
      described_class.new(
        radar_reading: radar,
        x: 1,
        y: 1,
        width: 2,
        height: 2
      )
    end

    it 'knows that it matched the invader' do
      expect(slice.matches?(invader)).to eq(true)
    end
  end
end
