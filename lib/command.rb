# frozen_string_literal: true

require_relative 'enum'

class Command < Enum
  M = Command.new 'M'
  L = Command.new 'L'
  R = Command.new 'R'
end
