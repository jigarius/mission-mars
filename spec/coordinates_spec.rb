# typed: false
# frozen_string_literal: true

require 'coordinates'

describe Coordinates do
  it 'returns x and y correctly' do
    coordinates = Coordinates.new(19, 2)

    expect(coordinates.x).to eq(19)
    expect(coordinates.y).to eq(2)
  end

  it 'modifies x and y correctly' do
    coordinates = Coordinates.new(19, 2)

    coordinates.x += 1
    coordinates.y -= 1

    expect(coordinates.x).to eq(20)
    expect(coordinates.y).to eq(1)
  end
end
