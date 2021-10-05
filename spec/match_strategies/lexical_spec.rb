require 'spec_helper'

RSpec.describe ::Invaders::MatchStrategies::Lexical do
  it 'computes no match for different strings' do
    expect(described_class.new('a', 'b').compute).to eq(0.0)
  end

  it 'computes full match for the same strings' do
    expect(described_class.new('aa', 'aa').compute).to eq(1.0)
  end

  it 'computes correct level when half of the chars match' do
    expect(described_class.new('aaaa', 'aacc').compute).to eq(0.5)
  end
end
