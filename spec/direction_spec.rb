# typed: false
# frozen_string_literal: true

require 'direction'

describe Direction do
  it '.values contain all 4 basic directions' do
    expected = [
      Direction::N,
      Direction::E,
      Direction::S,
      Direction::W
    ]
    expect(Direction.values).to eq(expected)
  end
end
