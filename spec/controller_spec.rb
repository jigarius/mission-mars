# typed: false
# frozen_string_literal: true

require 'controller'

describe Controller do
  subject { Controller.new }

  it 'can execute valid input' do
    expected = [
      '1 3 N',
      '5 1 E'
    ]

    input = [
      "5 5\n",
      "1 2 N\n",
      "LMLMLMLMM\n",
      "3 3 E\n",
      "MMRMMRMRRM\n",
      "\n"
    ]
    allow($stdin).to receive(:gets).and_return(*input)

    expect(subject.execute).to eq(expected)
  end

  it 'can raises when input is invalid' do
    allow($stdin).to receive(:gets).and_return("\n")

    expect { subject.execute }.to raise_error(Input::Parser::InvalidInputError)
  end
end
