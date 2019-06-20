module Types
  include Dry.Types()

  NumericToString = Types.Constructor(String) { |value| value.is_a?(Numeric) ? value.to_s : value }
end
