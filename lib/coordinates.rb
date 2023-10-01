# frozen_string_literal: true

class Coordinates
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    Coordinates === other &&
      @x == other.x &&
      @y == other.y
  end

  def to_s
    "#{x} #{y}"
  end
end
