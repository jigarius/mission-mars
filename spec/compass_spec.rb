# typed: false
# frozen_string_literal: true

require 'compass'

describe Compass do
  it 'tracks left turns correctly' do
    compass = Compass.new(Direction::N)
    expect(compass.direction).to equal(Direction::N)

    compass.turn_left
    expect(compass.direction).to equal(Direction::W)

    compass.turn_left
    expect(compass.direction).to equal(Direction::S)

    compass.turn_left
    expect(compass.direction).to equal(Direction::E)

    compass.turn_left
    expect(compass.direction).to equal(Direction::N)
  end

  it 'tracks right turns correctly' do
    compass = Compass.new(Direction::N)
    expect(compass.direction).to equal(Direction::N)

    compass.turn_right
    expect(compass.direction).to equal(Direction::E)

    compass.turn_right
    expect(compass.direction).to equal(Direction::S)

    compass.turn_right
    expect(compass.direction).to equal(Direction::W)

    compass.turn_right
    expect(compass.direction).to equal(Direction::N)
  end
end
