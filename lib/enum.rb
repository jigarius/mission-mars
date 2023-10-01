# frozen_string_literal: true

# Enum implementation created to replace T::Enum from Sorbet.
#
# TODO: Is there a better way to do this? Maybe, extend Hash?
# TODO: Values must be declared from within the class.
class Enum
  @@cases = {}

  def initialize(id)
    @id = id

    # Define a pocket for this Enum, if not already defined.
    @@cases[self.class.name] = {} if @@cases[self.class.name].nil?
    @@cases[self.class.name][id] = self
  end

  def to_s
    @id
  end

  def self.values
    @@cases[name].values
  end

  def self.deserialize(value)
    value = value.to_s
    raise KeyError, "Invalid argument: #{value}" unless @@cases[name].key?(value)

    @@cases[name][value]
  end
end
