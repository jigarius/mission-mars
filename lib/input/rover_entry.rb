# typed: strict
# frozen_string_literal: true

require 'command'
require 'coordinates'
require 'direction'

class Input
  class RoverEntry < T::Struct
    extend T::Sig

    const :coordinates, Coordinates
    const :direction, Direction
    const :commands, T::Array[Command]

    sig { params(other: BasicObject).returns(T::Boolean) }
    def ==(other)
      RoverEntry === other &&
        coordinates == other.coordinates &&
        direction == other.direction &&
        commands == other.commands
    end
  end
end
