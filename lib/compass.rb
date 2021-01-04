# typed: strict
# frozen_string_literal: true

require 'direction'

class Compass
  extend T::Sig

  DIRECTIONS = T.let(
    {
      0 => Direction::N,
      1 => Direction::E,
      2 => Direction::S,
      3 => Direction::W
    },
    T::Hash[Integer, Direction]
  )

  sig { params(direction: Direction).void }
  def initialize(direction)
    @direction_index = T.let(
      T.must(DIRECTIONS.key(direction)),
      Integer
    )
  end

  sig { returns(Direction) }
  def direction
    T.must(DIRECTIONS[@direction_index])
  end

  sig { void }
  def turn_left
    @direction_index =
      if @direction_index.zero?
        DIRECTIONS.length - 1
      else
        @direction_index - 1
      end
  end

  sig { void }
  def turn_right
    @direction_index =
      if @direction_index == DIRECTIONS.length - 1
        0
      else
        @direction_index + 1
      end
  end
end
