# typed: ignore
# frozen_string_literal: true

require 'rover'
require 'command'

describe Rover do
  subject do
    Rover.new(
      position: Coordinates.new(5, 5),
      direction: Direction::N,
      region: Region::SimpleRectangularRegion.new(
        Coordinates.new(10, 10)
      )
    )
  end

  it 'intializes correctly' do
    expect(subject.direction).to eql(Direction::N)
    expect(subject.position).to eq(Coordinates.new(5, 5))
    expect(subject.region)
      .to eq(Region::SimpleRectangularRegion.new(Coordinates.new(10, 10)))
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

    expect(subject.position).to eq(Coordinates.new(5, 6))
  end

  it 'can move east' do
    subject.execute(Command::R)
    subject.execute(Command::M)

    expect(subject.position).to eq(Coordinates.new(6, 5))
  end

  it 'can move west' do
    subject.execute(Command::L)
    subject.execute(Command::M)

    expect(subject.position).to eq(Coordinates.new(4, 5))
  end

  it 'can move south' do
    subject.execute(Command::R)
    subject.execute(Command::R)
    subject.execute(Command::M)

    expect(subject.position).to eq(Coordinates.new(5, 4))
  end

  it 'cannot be instantiated outside allowed region' do
    expect do
      Rover.new(
        position: Coordinates.new(5, 5),
        direction: Direction::N,
        region: Region::SimpleRectangularRegion.new(
          Coordinates.new(2, 2)
        )
      )
    end.to raise_error(Rover::OutOfBoundsError)
  end

  it 'cannot move beyond the west boundary' do
    rover = Rover.new(
      position: Coordinates.new(0, 1),
      direction: Direction::W,
      region: Region::SimpleRectangularRegion.new(
        Coordinates.new(2, 2)
      )
    )

    expect { rover.execute(Command::M) }
      .to raise_error(Rover::OutOfBoundsError)
  end

  it 'cannot move beyond the east boundary' do
    rover = Rover.new(
      position: Coordinates.new(2, 1),
      direction: Direction::E,
      region: Region::SimpleRectangularRegion.new(
        Coordinates.new(2, 2)
      )
    )

    expect { rover.execute(Command::M) }
      .to raise_error(Rover::OutOfBoundsError)
  end

  it 'cannot move beyond the north boundary' do
    rover = Rover.new(
      position: Coordinates.new(1, 2),
      direction: Direction::N,
      region: Region::SimpleRectangularRegion.new(
        Coordinates.new(2, 2)
      )
    )

    expect { rover.execute(Command::M) }
      .to raise_error(Rover::OutOfBoundsError)
  end

  it 'cannot move beyond the south boundary' do
    rover = Rover.new(
      position: Coordinates.new(1, 0),
      direction: Direction::S,
      region: Region::SimpleRectangularRegion.new(
        Coordinates.new(2, 2)
      )
    )

    expect { rover.execute(Command::M) }
      .to raise_error(Rover::OutOfBoundsError)
  end
end
