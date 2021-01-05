# typed: ignore
# frozen_string_literal: true

require 'input'

class Input
  describe RoverEntry do
    subject do
      Input::RoverEntry.new(
        position: Coordinates.new(5, 5),
        direction: Direction::N,
        commands: [
          Command::L,
          Command::M,
          Command::R,
          Command::M,
        ]
      )
    end

    it 'instantiates correctly' do
      expect(subject.position).to eq(Coordinates.new(5, 5))
      expect(subject.direction).to eql(Direction::N)
      commands = [
        Command::L,
        Command::M,
        Command::R,
        Command::M,
      ]
      expect(subject.commands).to eq(commands)
    end

    it 'checks equality correctly' do
      other = Input::RoverEntry.new(
        position: Coordinates.new(5, 5),
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
        position: Coordinates.new(3, 3),
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
