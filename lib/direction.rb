# frozen_string_literal: true

require_relative 'enum'

class Direction < Enum
  N = Direction.new 'N'
  E = Direction.new 'E'
  S = Direction.new 'S'
  W = Direction.new 'W'
end
