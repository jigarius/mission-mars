# typed: false
# frozen_string_literal: true

require 'direction'

describe Direction do
  it 'contains the 4 basic directions' do
    expected = [
      Direction::N,
      Direction::E,
      Direction::S,
      Direction::W
    ]
    expect(Direction.values).to eq(expected)
  end

  it 'can be converted to String' do
    expected = ["N", "E", "S", "W"]
    expect(Direction.values.map(&:to_s)).to eq(expected)
  end
end
