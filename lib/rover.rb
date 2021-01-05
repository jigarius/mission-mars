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
  attr_reader :position

  sig { returns(Region) }
  attr_reader :region

  def_delegator :@compass, :direction

  sig do  params(
    position: Coordinates,
    direction: Direction,
    region: Region
  ).void
  end
  def initialize(position:, direction:, region:)
    raise OutOfBoundsError unless region.contains? position

    @position = T.let(position, Coordinates)
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
    new_position = Coordinates.new(@position.x, @position.y)

    case direction = @compass.direction
    when Direction::N
      new_position.y += 1
    when Direction::S
      new_position.y -= 1
    when Direction::E
      new_position.x += 1
    when Direction::W
      new_position.x -= 1
    else
      T.absurd(direction)
    end

    raise OutOfBoundsError unless @region.contains? new_position

    @position = new_position
  end
end
