# typed: false
# frozen_string_literal: true

require 'compass'

describe Compass do
  subject do
    Compass.new(Direction::N)
  end

  it 'tracks left turns correctly' do
    expect(subject.direction).to equal(Direction::N)

    subject.turn_left
    expect(subject.direction).to equal(Direction::W)

    subject.turn_left
    expect(subject.direction).to equal(Direction::S)

    subject.turn_left
    expect(subject.direction).to equal(Direction::E)

    subject.turn_left
    expect(subject.direction).to equal(Direction::N)
  end

  it 'tracks right turns correctly' do
    expect(subject.direction).to equal(Direction::N)

    subject.turn_right
    expect(subject.direction).to equal(Direction::E)

    subject.turn_right
    expect(subject.direction).to equal(Direction::S)

    subject.turn_right
    expect(subject.direction).to equal(Direction::W)

    subject.turn_right
    expect(subject.direction).to equal(Direction::N)
  end
end
