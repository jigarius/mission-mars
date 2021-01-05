# typed: strict
# frozen_string_literal: true

require_relative '../command'

class Input
  class Parser
    extend T::Sig

    class InvalidInputError < StandardError; end

    sig { params(string: String).returns(Input) }
    def parse_string(string)
      lines = string.split(/\n/)
      raise InvalidInputError if lines.length.zero?

      limit = parse_coordinates(T.must(lines.shift).strip)

      rover_entries = []
      until lines.empty?
        line1 = lines.shift&.strip
        line2 = lines.shift&.strip
        raise InvalidInputError if line1.nil? || line2.nil?

        orientation = parse_rover_orientation(line1)

        rover_entries << RoverEntry.new(
          position: orientation[:coordinates],
          direction: orientation[:direction],
          commands: parse_rover_commands(line2)
        )
      end

      Input.new(limit, rover_entries)
    end

    sig { returns(Input) }
    def parse_stdin
      lines = ''
      while (line = $stdin.gets.chomp)
        break if line.empty?

        lines += "#{line}\n"
      end

      parse_string(lines)
    end

    private

    sig { params(line: String).returns(Coordinates) }
    def parse_coordinates(line)
      matches = line.match(/^(\d+)\s+(\d+)$/)
      raise InvalidInputError unless matches

      Coordinates.new(matches[1].to_i, matches[2].to_i)
    end

    sig do
      params(line: String)
        .returns({
          coordinates: Coordinates,
          direction: Direction,
        })
    end
    def parse_rover_orientation(line)
      matches = line.match(/^(?<coordinates>\d+\s+\d+)\s+(?<direction>\w)$/)
      raise InvalidInputError unless matches

      {
        coordinates: parse_coordinates(T.must(matches[:coordinates])),
        direction: Direction.deserialize(T.must(matches[:direction]).downcase),
      }
    rescue KeyError => e
      raise InvalidInputError, e.message
    end

    sig { params(line: String).returns(T::Array[Command]) }
    def parse_rover_commands(line)
      commands = line.split('')
      commands.map { |c| Command.deserialize(c.downcase) }
    rescue KeyError => e
      raise InvalidInputError, e.message
    end
  end
end
