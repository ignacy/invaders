require 'spec_helper'

RSpec.describe ::Invaders::RadarReading do
  context 'creating reading' do
    it 'should be possible to create radar reading from string ' do
      radar_reading = described_class.new("abec\ndefg")
      expect(radar_reading.rows).to match_array(%w[abec defg])
    end

    it 'should not be possible to have an empty string as an radar_reading' do
      expect do
        described_class.new('')
      end.to raise_error(ArgumentError)
    end
  end

  context 'dimensions' do
    it 'should know its height and witdh' do
      radar_reading = described_class.new("abec\ndefg")
      expect(radar_reading.width).to eq(4)
      expect(radar_reading.height).to eq(2)
    end
  end
end
