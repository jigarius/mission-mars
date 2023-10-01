# frozen_string_literal: true

require_relative 'coordinates'

module Region
  def contains?(coordinates); end

  # Region between the origin (0, 0) and a specified point (x, y).
  class SimpleRectangularRegion
    include Region

    attr_reader :vertex

    # Coordinates of 2 diagonally opposite corners of the rectangle.
    def initialize(vertex)
      @origin = Coordinates.new(0, 0)
      @vertex = vertex
    end

    def contains?(coordinates)
      return false if coordinates.x < @origin.x || coordinates.y < @origin.y

      return false if coordinates.x > @vertex.x || coordinates.y > @vertex.y

      true
    end

    def ==(other)
      SimpleRectangularRegion === other &&
        vertex == other.vertex
    end
  end
end
