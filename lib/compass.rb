# frozen_string_literal: true

require_relative 'direction'

class Compass
  DIRECTIONS = {
    0 => Direction::N,
    1 => Direction::E,
    2 => Direction::S,
    3 => Direction::W,
  }.freeze

  def initialize(direction)
    @direction_index = DIRECTIONS.key(direction)
  end

  def direction
    DIRECTIONS[@direction_index]
  end

  def turn_left
    @direction_index =
      if @direction_index.zero?
        DIRECTIONS.length - 1
      else
        @direction_index - 1
      end
  end

  def turn_right
    @direction_index =
      if @direction_index == DIRECTIONS.length - 1
        0
      else
        @direction_index + 1
      end
  end
end
