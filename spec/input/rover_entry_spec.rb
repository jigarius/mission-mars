# typed: ignore
# frozen_string_literal: true

require 'input'

class Input
  describe RoverEntry do
    subject do
      Input::RoverEntry.new(
        coordinates: Coordinates.new(5, 5),
        direction: Direction::N,
        commands: [
          Command::L,
          Command::M,
          Command::R,
          Command::M,
        ]
      )
    end

    it 'returns coordinates correctly' do
      expect(subject.coordinates).to eq(Coordinates.new(5, 5))
    end

    it 'returns direction correctly' do
      expect(subject.direction).to eql(Direction::N)
    end

    it 'returns commands correctly' do
      expectation = [
        Command::L,
        Command::M,
        Command::R,
        Command::M,
      ]
      expect(subject.commands).to eq(expectation)
    end

    it 'checks equality correctly' do
      other = Input::RoverEntry.new(
        coordinates: Coordinates.new(5, 5),
        direction: Direction::N,
        commands: [
          Command::L,
          Command::M,
          Command::R,
          Command::M,
        ]
      )

      expect(subject).to eq(other)
    end

    it 'checks inequality correctly' do
      other = Input::RoverEntry.new(
        coordinates: Coordinates.new(3, 3),
        direction: Direction::N,
        commands: [
          Command::L,
          Command::M,
          Command::R,
          Command::M,
        ]
      )

      expect(subject).not_to eq(other)
    end
  end
end
