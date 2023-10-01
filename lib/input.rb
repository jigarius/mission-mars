# frozen_string_literal: true

require_relative 'coordinates'
require_relative 'input/rover_entry'
require_relative 'input/parser'

class Input
  attr_reader :limit

  attr_reader :rover_entries

  def initialize(
    limit,
    rover_entries
  )
    @limit = limit
    @rover_entries = rover_entries
  end

  def ==(other)
    Input === other &&
      @limit == other.limit &&
      @rover_entries == other.rover_entries
  end
end
