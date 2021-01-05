# typed: strict
# frozen_string_literal: true

class Coordinates
  extend T::Sig

  sig { returns(Integer) }
  attr_accessor :x, :y

  sig { params(x: Integer, y: Integer).void }
  def initialize(x, y)
    @x = x
    @y = y
  end

  sig { params(other: BasicObject).returns(T::Boolean) }
  def ==(other)
    return false unless Coordinates === other

    @x == other.x && @y == other.y
  end

  sig { returns(String) }
  def to_s
    return "#{x} #{y}"
  end
end
