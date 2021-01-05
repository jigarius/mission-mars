# typed: ignore
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

  it 'delegates .direction to Compass' do
    expect_any_instance_of(Compass).to receive(:direction)
    subject.direction
  end

  it 'delegates command L to Compass.turn_left' do
    expect_any_instance_of(Compass).to receive(:turn_left)
    subject.execute(Command::L)
  end

  it 'delegates command R to Compass.turn_right' do
    expect_any_instance_of(Compass).to receive(:turn_right)
    subject.execute(Command::R)
  end

  it 'can move north' do
    subject.execute(Command::M)

    expect(subject.coordinates).to eq(Coordinates.new(5, 6))
  end

  it 'can move east' do
    subject.execute(Command::R)
    subject.execute(Command::M)

    expect(subject.coordinates).to eq(Coordinates.new(6, 5))
  end

  it 'can move west' do
    subject.execute(Command::L)
    subject.execute(Command::M)

    expect(subject.coordinates).to eq(Coordinates.new(4, 5))
  end

  it 'can move south' do
    subject.execute(Command::R)
    subject.execute(Command::R)
    subject.execute(Command::M)

    expect(subject.coordinates).to eq(Coordinates.new(5, 4))
  end
end
