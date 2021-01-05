# typed: false
# frozen_string_literal: true

require 'coordinates'

describe Coordinates do
  subject { Coordinates.new(19, 2) }

  it 'returns x and y correctly' do
    expect(subject.x).to eq(19)
    expect(subject.y).to eq(2)
  end

  it 'modifies x and y correctly' do
    subject.x += 1
    subject.y -= 1

    expect(subject.x).to eq(20)
    expect(subject.y).to eq(1)
  end

  it 'checks equality correctly' do
    expect(subject).to eq(Coordinates.new(19, 2))
  end

  it 'checks inequality correctly' do
    expect(subject).not_to eq(Coordinates.new(2, 19))
    expect(subject).not_to eq(Coordinates.new(19, 0))
    expect(subject).not_to eq(Coordinates.new(0, 2))
  end
end
