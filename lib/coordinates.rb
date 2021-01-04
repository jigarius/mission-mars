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
end
