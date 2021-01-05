# typed: strict
# frozen_string_literal: true

require 'forwardable'

require_relative 'compass'
require_relative 'coordinates'
require_relative 'direction'
require_relative 'region'

class Rover
  extend T::Sig
  extend Forwardable

  class OutOfBoundsError < StandardError; end

  sig { returns(Coordinates) }
  attr_reader :coordinates

  def_delegator :@compass, :direction

  sig do  params(
    coordinates: Coordinates,
    direction: Direction,
    region: Region
  ).void
  end
  def initialize(coordinates:, direction:, region:)
    raise OutOfBoundsError unless region.contains? coordinates

    @coordinates = T.let(
      coordinates,
      Coordinates
    )
    @compass = T.let(
      Compass.new(direction),
      Compass
    )
    @region = region
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
    new_coordinates = Coordinates.new(@coordinates.x, @coordinates.y)

    case direction = @compass.direction
    when Direction::N
      new_coordinates.y += 1
    when Direction::S
      new_coordinates.y -= 1
    when Direction::E
      new_coordinates.x += 1
    when Direction::W
      new_coordinates.x -= 1
    else
      T.absurd(direction)
    end

    raise OutOfBoundsError unless @region.contains? new_coordinates

    @coordinates = new_coordinates
  end
end
