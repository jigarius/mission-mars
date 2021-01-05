# typed: strict
# frozen_string_literal: true

require_relative 'input'
require_relative 'rover'

class Controller
  extend T::Sig

  sig { returns(T::Array[String]) }
  def execute
    input = Input::Parser.new.parse_stdin

    input.rover_entries.map do |re|
      rover = handle_rover_entry(re)
      "#{rover.coordinates.x} #{rover.coordinates.y} #{rover.direction}"
    end
  end

  private

  sig { params(rover_entry: Input::RoverEntry).returns(Rover) }
  def handle_rover_entry(rover_entry)
    rover = Rover.new(
      coordinates: rover_entry.coordinates,
      direction: rover_entry.direction,
    )

    rover_entry.commands.each { |c| rover.execute(c) }

    rover
  end
end
