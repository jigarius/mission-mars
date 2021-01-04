# typed: false
# frozen_string_literal: true

require 'rover'

describe Rover do
  before :each do
    @rover = Rover.new(
      coordinates: Coordinates.new(0, 0),
      direction: Direction::N
    )
  end

  it 'can .intialize' do
    expect(@rover.direction).to eql(Direction::N)
    expect(@rover.coordinates).to eq(Coordinates.new(0, 0))
  end

  it 'delegates .turn_left to Compass' do
    expect_any_instance_of(Compass).to receive(:turn_left)
    @rover.turn_left
  end

  it 'delegates .turn_right to Compass' do
    expect_any_instance_of(Compass).to receive(:turn_right)
    @rover.turn_right
  end

  it 'delegates .direction to Compass' do
    expect_any_instance_of(Compass).to receive(:direction)
    @rover.direction
  end
end
