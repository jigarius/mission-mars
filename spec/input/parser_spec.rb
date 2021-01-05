# typed: false
# frozen_string_literal: true

require 'input'

class Input
  describe Parser do
    subject { Input::Parser.new }

    it 'can parse a string and create input' do
      expected = Input.new(
        Coordinates.new(5, 5),
        [
          Input::RoverEntry.new(
            coordinates: Coordinates.new(1, 2),
            direction: Direction::N,
            commands: [
              Command::L,
              Command::M,
              Command::R,
              Command::M,
            ]
          ),
        ]
      )

      result = subject.parse_string(<<~EOF)
        5 5
        1 2 N
        LMRM
      EOF

      expect(result).to eq(expected)
    end

    it "can parse stdin and create input" do
      expected = Input.new(
        Coordinates.new(5, 5),
        [
          Input::RoverEntry.new(
            coordinates: Coordinates.new(1, 2),
            direction: Direction::N,
            commands: [
              Command::L,
              Command::M,
              Command::R,
              Command::M,
            ]
          ),
        ]
      )

      input = [
        "5 5\n",
        "1 2 N\n",
        "LMRM\n",
        "\n"
      ]
      allow($stdin).to receive(:gets).and_return(*input)

      expect(subject.parse_stdin).to eq(expected)
    end

    it 'raises if input has no lines' do
      expect { subject.parse_string('') }
        .to raise_error(Input::Parser::InvalidInputError)
    end

    it 'raises if limit is invalid' do
      inputs = [
        # Y is missing.
        "5\n" \
        "1 2 N\n" \
        "LMRM\n",
        # X is non-numeric.
        "N 5\n" \
        "1 2 N\n" \
        "LMRM\n",
        # Y is non-numeric.
        "5 N\n" \
        "1 2 N\n" \
        "LMRM\n",
        # Extra character after X and Y.
        "5 5 3\n" \
        "1 2 N\n" \
        "LMRM",
      ]

      inputs.each do |input|
        expect { subject.parse_string(input) }
          .to raise_error(Input::Parser::InvalidInputError)
      end
    end

    it 'raises if rover entries are invalid' do
      inputs = [
        # X is non-numeric.
        "5 5\n" \
        "N 2\n" \
        "LMRM\n",
        # Y is non-numeric.
        "5 5\n" \
        "2 N\n" \
        "LMRM\n",
        # Y is missing.
        "5 5\n" \
        "2\n" \
        "LMRM\n",
        # Direction is invalid.
        "5 5\n" \
        "1 2 D\n" \
        "LMRM\n",
        # Extra character after direction.
        "5 5\n" \
        "2 2 N 2\n" \
        "LMRM\n",
        # Initial coordinates and direction not provided.
        "5 5\n" \
        "LMRM\n",
        # Command is invalid.
        "5 5\n" \
        "1 2 N\n" \
        "LCRM\n",
        # Command is empty.
        "5 5\n" \
        "1 2 N\n" \
        "\n",
      ]

      inputs.each do |input|
        expect { subject.parse_string(input) }
          .to raise_error(Input::Parser::InvalidInputError)
      end
    end
  end
end
