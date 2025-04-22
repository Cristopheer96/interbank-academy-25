# frozen_string_literal: true

# Represents a single bank transaction
class Transaction
  attr_reader :id, :type, :amount

  def initialize(id:, type:, amount:)
    @id     = id
    @type   = type
    @amount = amount
  end
end
