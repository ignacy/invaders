require 'spec_helper'

RSpec.describe ::Invaders::MatchStrategies::Exact do
  it 'computes no match for different strings' do
    expect(described_class.new('a', 'b').compute).to eq(0.0)
  end

  it 'computes full match for the same strings' do
    expect(described_class.new('aa', 'aa').compute).to eq(1.0)
  end

  it 'computes no match for similar but different strings' do
    expect(described_class.new('aaaa', 'aacc').compute).to eq(0.0)
  end
end
