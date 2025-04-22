# frozen_string_literal: true

# Performs all analytics on a array of Transaction objects
class TransactionAnalyzer
  def initialize(transactions)
    @transactions = transactions
  end

  def final_balance
    credits = sum_by_type('Crédito')
    debits  = sum_by_type('Débito')
    (credits - debits)
  end

  def highest_transaction
    @transactions.max_by(&:amount)
  end

  def count_by_type
    counts = Hash.new(0)
    @transactions.each do |transaction|
      counts[transaction.type] += 1
    end
    counts
  end

  private

  def sum_by_type(type)
    @transactions
      .select { |transaction| transaction.type == type }
      .sum(&:amount)
  end
end
