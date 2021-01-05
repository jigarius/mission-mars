# typed: strict
# frozen_string_literal: true

require 'coordinates'
require 'input/rover_entry'
require 'input/parser'

class Input
  extend T::Sig

  sig { returns(Coordinates) }
  attr_reader :limit

  sig { returns(T::Array[RoverEntry]) }
  attr_reader :rover_entries

  sig do
    params(
      limit: Coordinates,
      rover_entries: T::Array[RoverEntry]
    ).void
  end
  def initialize(
    limit,
    rover_entries
  )
    @limit = limit
    @rover_entries = rover_entries
  end

  sig { params(other: BasicObject).returns(T::Boolean) }
  def ==(other)
    Input === other &&
      @limit == other.limit &&
      @rover_entries == other.rover_entries
  end
end
