# typed: strict
# frozen_string_literal: true

class Direction < T::Enum
  enums do
    N = new
    E = new
    S = new
    W = new
  end

  sig { returns(String) }
  def to_s
    serialize.upcase
  end
end
