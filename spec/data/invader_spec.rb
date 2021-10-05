# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Invaders::Invader do
  context 'creating invaders' do
    it 'should be possible to create an invader from string ' do
      invader = described_class.new("abec\ndefg")
      expect(invader.rows).to match_array(%w[abec defg])
    end

    it 'should not be possible to have an empty string as an invader' do
      expect do
        described_class.new('')
      end.to raise_error(ArgumentError)
    end
  end

  context 'dimensions' do
    it 'should know its height and witdh' do
      invader = described_class.new("abec\ndefg")
      expect(invader.width).to eq(4)
      expect(invader.height).to eq(2)
    end
  end
end
