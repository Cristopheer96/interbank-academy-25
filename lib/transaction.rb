# frozen_string_literal: true

# Represents a single bank transaction
class Transaction
  attr_reader :id, :type, :amount

  TYPE_AVAILABLE = %w[Débito Crédito].freeze

  def initialize(id:, type:, amount:)
    raise ArgumentError, 'ID must be an Integer' unless id.is_a? Integer
    raise ArgumentError, "type must be 'Débito o Crédito'" unless TYPE_AVAILABLE.include?(type)
    raise ArgumentError, 'amount must be an Numeric' unless amount.is_a? Numeric

    @id     = id
    @type   = type
    @amount = amount
  end
end
