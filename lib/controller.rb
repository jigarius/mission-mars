# frozen_string_literal: true

require_relative 'input'
require_relative 'rover'

class Controller
  def introduce
    puts "Welcome to Mission Mars!\n"
    puts "Enter your commands, followed by an empty line.\n"
    puts "For more info, see the readme.\n"
    puts "\n"
  end

  def initialize(parser)
    @parser = parser
    @martian_plateau = nil
    @input = nil
  end

  def execute
    @input = @parser.parse_stdin
    @martian_plateau = Region::SimpleRectangularRegion.new(@input.limit)

    handle_rover_entries
  end

  private

  def handle_rover_entries
    raise RuntimeError unless @input

    @input.rover_entries.map do |rover_entry|
      rover = Rover.new(
        position: rover_entry.position,
        direction: rover_entry.direction,
        region: @martian_plateau
      )

      rover_entry.commands.each { |c| rover.execute(c) }

      "#{rover.position} #{rover.direction}"
    end
  end
end
