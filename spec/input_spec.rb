# typed: ignore
# frozen_string_literal: true

require 'input'

describe Input do
  subject do
    Input.new(
      Coordinates.new(5, 5),
      [
        Input::RoverEntry.new(
          coordinates: Coordinates.new(5, 5),
          direction: Direction::N,
          commands: [
            Command::L,
            Command::M,
            Command::R,
            Command::M,
          ]
        ),
      ]
    )
  end

  it 'returns .limit' do
    expect(subject.limit).to eq(Coordinates.new(5, 5))
  end

  it 'returns .rover_entries' do
    expectation = [
      Input::RoverEntry.new(
        coordinates: Coordinates.new(5, 5),
        direction: Direction::N,
        commands: [
          Command::L,
          Command::M,
          Command::R,
          Command::M,
        ]
      ),
    ]

    expect(subject.rover_entries).to eq(expectation)
  end

  it 'checks equality correctly' do
    other = Input.new(
      Coordinates.new(5, 5),
      [
        Input::RoverEntry.new(
          coordinates: Coordinates.new(5, 5),
          direction: Direction::N,
          commands: [
            Command::L,
            Command::M,
            Command::R,
            Command::M,
          ]
        ),
      ]
    )

    expect(subject).to eq(other)
  end

  it 'checks inequality correctly' do
    other = Input.new(
      Coordinates.new(3, 3),
      [
        Input::RoverEntry.new(
          coordinates: Coordinates.new(5, 5),
          direction: Direction::N,
          commands: [
            Command::L,
            Command::M,
            Command::R,
            Command::M,
          ]
        ),
      ]
    )

    expect(subject).not_to eq(other)
  end
end
