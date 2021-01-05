# typed: strict
# frozen_string_literal: true

require_relative 'input'
require_relative 'rover'

class Controller
  extend T::Sig

  sig { returns(T::Array[String]) }
  def execute
    introduce

    input = Input::Parser.new.parse_stdin

    input.rover_entries.map do |re|
      rover = handle_rover_entry(re)
      "#{rover.coordinates.x} #{rover.coordinates.y} #{rover.direction}"
    end
  end

  private

  sig { void }
  def introduce
    puts "Welcome to Mission Mars!\n"
    puts "Enter your commands, followed by an empty line.\n"
    puts "For more info, see the readme.\n"
    puts "\n"
  end

  sig { params(rover_entry: Input::RoverEntry).returns(Rover) }
  def handle_rover_entry(rover_entry)
    rover = Rover.new(
      coordinates: rover_entry.coordinates,
      direction: rover_entry.direction
    )

    rover_entry.commands.each { |c| rover.execute(c) }

    rover
  end
end
