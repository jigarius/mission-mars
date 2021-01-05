# typed: strict
# frozen_string_literal: true

require 'forwardable'

require_relative 'compass'
require_relative 'coordinates'
require_relative 'direction'

class Rover
  extend T::Sig
  extend Forwardable

  sig { returns(Coordinates) }
  attr_reader :coordinates

  def_delegator :@compass, :direction

  sig { params(coordinates: Coordinates, direction: Direction).void }
  def initialize(coordinates:, direction:)
    @coordinates = T.let(
      coordinates,
      Coordinates
    )
    @compass = T.let(
      Compass.new(direction),
      Compass
    )
  end

  sig { params(command: Command).void }
  def execute(command)
    case command
    when Command::M then move
    when Command::L then @compass.turn_left
    when Command::R then @compass.turn_right
    else
      T.absurd(command)
    end
  end

  private

  sig { void }
  def move
    case direction = @compass.direction
    when Direction::N
      @coordinates.y += 1
    when Direction::S
      @coordinates.y -= 1
    when Direction::E
      @coordinates.x += 1
    when Direction::W
      @coordinates.x -= 1
    else
      T.absurd(direction)
    end
  end
end
