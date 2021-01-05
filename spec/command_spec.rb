# typed: ignore
# frozen_string_literal: true

require 'command'

describe Command do
  it 'contains all possible values' do
    expected = [
      Command::M,
      Command::L,
      Command::R,
    ]
    expect(Command.values).to eq(expected)
  end
end
