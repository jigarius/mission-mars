# frozen_string_literal: true

require_relative '../command'
require_relative '../coordinates'
require_relative '../direction'

class Input
  class RoverEntry
    attr_reader :position, :direction, :commands

    def initialize(position:, direction:, commands:)
      @position = position
      @direction = direction
      @commands = commands
    end

    def ==(other)
      RoverEntry === other &&
        position == other.position &&
        direction == other.direction &&
        commands == other.commands
    end
  end
end
