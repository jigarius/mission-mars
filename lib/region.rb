# typed: strict
# frozen_string_literal: true

require_relative 'coordinates'

module Region
  extend T::Sig
  extend T::Helpers

  interface!

  sig { abstract.params(coordinates: Coordinates).returns(T::Boolean) }
  def contains?(coordinates); end

  # Region between the origin (0, 0) and a specified point (x, y).
  class SimpleRectangularRegion
    extend T::Sig

    include Region

    sig { returns(Coordinates) }
    attr_reader :vertex

    # Coordinates of 2 diagonally opposite corners of the rectangle.
    sig { params(vertex: Coordinates).void }
    def initialize(vertex)
      @origin = T.let(
        Coordinates.new(0, 0),
        Coordinates
      )
      @vertex = T.let(vertex, Coordinates)
    end

    sig { override.params(coordinates: Coordinates).returns(T::Boolean) }
    def contains?(coordinates)
      return false if coordinates.x < @origin.x || coordinates.y < @origin.y

      return false if coordinates.x > @vertex.x || coordinates.y > @vertex.y

      true
    end

    sig { params(other: BasicObject).returns(T::Boolean) }
    def ==(other)
      SimpleRectangularRegion === other &&
        vertex === other.vertex
    end
  end
end
