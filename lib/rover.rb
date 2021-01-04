# typed: strict
# frozen_string_literal: true

require 'direction'
require 'coordinates'

class Rover
  extend T::Sig
  extend Forwardable

  sig { returns(Coordinates) }
  attr_reader :coordinates

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
      @coordinates.y -= 1
    else
      T.absurd(direction)
    end
  end

  def_delegators :@compass, :direction, :turn_left, :turn_right
end
