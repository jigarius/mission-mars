# typed: strict
# frozen_string_literal: true

require_relative 'input'
require_relative 'rover'

class Controller
  extend T::Sig

  sig { void }
  def introduce
    puts "Welcome to Mission Mars!\n"
    puts "Enter your commands, followed by an empty line.\n"
    puts "For more info, see the readme.\n"
    puts "\n"
  end

  sig { returns(T::Array[String]) }
  def execute
    @input = Input::Parser.new.parse_stdin
    @martian_plateau = Region::SimpleRectangularRegion.new(@input.limit)

    handle_rover_entries
  end

  private

  sig { returns(T::Array[String]) }
  def handle_rover_entries
    @input.rover_entries.map do |rover_entry|
      rover = Rover.new(
        position: rover_entry.position,
        direction: rover_entry.direction,
        region: @martian_plateau
      )

      rover_entry.commands.each { |c| rover.execute(c) }

      "#{rover.position.x} #{rover.position.y} #{rover.direction}"
    end
  end
end
