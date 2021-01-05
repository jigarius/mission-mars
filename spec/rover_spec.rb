# typed: false
# frozen_string_literal: true

require 'rover'

describe Rover do
  subject do
    Rover.new(
      coordinates: Coordinates.new(5, 5),
      direction: Direction::N
    )
  end

  it 'can .intialize' do
    expect(subject.direction).to eql(Direction::N)
    expect(subject.coordinates).to eq(Coordinates.new(5, 5))
  end

  it 'delegates .turn_left to Compass' do
    expect_any_instance_of(Compass).to receive(:turn_left)
    subject.turn_left
  end

  it 'delegates .turn_right to Compass' do
    expect_any_instance_of(Compass).to receive(:turn_right)
    subject.turn_right
  end

  it 'delegates .direction to Compass' do
    expect_any_instance_of(Compass).to receive(:direction)
    subject.direction
  end

  it 'can move north' do
    subject.move

    expect(subject.coordinates).to eq(Coordinates.new(5, 6))
  end

  it 'can move east' do
    subject.turn_right
    subject.move

    expect(subject.coordinates).to eq(Coordinates.new(6, 5))
  end

  it 'can move west' do
    subject.turn_left
    subject.move

    expect(subject.coordinates).to eq(Coordinates.new(4, 5))
  end

  it 'can move south' do
    subject.turn_right
    subject.turn_right
    subject.move

    expect(subject.coordinates).to eq(Coordinates.new(5, 4))
  end
end
