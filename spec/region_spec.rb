# typed: false
# frozen_string_literal: true

require 'region'

module Region
  describe SimpleRectangularRegion do
    subject do
      SimpleRectangularRegion.new(
        Coordinates.new(15, 20)
      )
    end

    it 'returns true for coordinates that are inside' do
      cases = [
        # Comfortably inside.
        Coordinates.new(5, 5),
        # On the bottom boundary.
        Coordinates.new(0, 5),
        # On the left boundary.
        Coordinates.new(5, 0),
        # On the top boundary.
        Coordinates.new(15, 5),
        # On the right boundary.
        Coordinates.new(5, 20),
      ]

      cases.each do |coordinates|
        expect(subject.contains?(coordinates)).to be true
      end
    end

    it 'returns false for coordinates that are outside' do
      cases = [
        # Beyond left boundary.
        Coordinates.new(-1, 5),
        # Beyond bottom boundary.
        Coordinates.new(5, -1),
        # Beyond right boundary.
        Coordinates.new(16, 5),
        # Beyond top boundary.
        Coordinates.new(5, 21),
      ]

      cases.each do |coordinates|
        expect(subject.contains?(coordinates)).to be false
      end
    end
  end
end
