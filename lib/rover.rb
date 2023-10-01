# frozen_string_literal: true

require 'forwardable'

require_relative 'compass'
require_relative 'coordinates'
require_relative 'direction'
require_relative 'region'

class Rover
  extend Forwardable

  class OutOfBoundsError < StandardError; end

  attr_reader :position

  attr_reader :region

  def_delegator :@compass, :direction

  def initialize(position:, direction:, region:)
    raise OutOfBoundsError unless region.contains? position

    @position = position
    @compass = Compass.new(direction)
    @region = region
  end

  def execute(command)
    case command
    when Command::M then move
    when Command::L then @compass.turn_left
    when Command::R then @compass.turn_right
    else
      raise StandardError "Unknown command: #{command}"
    end
  end

  private

  def move
    new_position = Coordinates.new(@position.x, @position.y)

    case direction = @compass.direction
    when Direction::N
      new_position.y += 1
    when Direction::S
      new_position.y -= 1
    when Direction::E
      new_position.x += 1
    when Direction::W
      new_position.x -= 1
    else
      raise StandardError "Unknown direction: #{direction}"
    end

    raise OutOfBoundsError unless @region.contains? new_position

    @position = new_position
  end
end
