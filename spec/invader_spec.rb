# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Invaders::Invader do
  context 'creating invaders' do
    it 'should be possible to create an invader from string ' do
      invader = described_class.new("abec\ndefg")
      expect(invader.to_a).to match_array(%w[abec defg])
    end

    it 'should not be possible to have an empty string as an invader' do
      expect do
        described_class.new('')
      end.to raise_error(ArgumentError)
    end
  end
end
