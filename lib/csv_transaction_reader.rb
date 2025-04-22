# frozen_string_literal: true

# class responsible for reading the CSV, converting each line into a Transaction object, and returning an Transactions

require 'smarter_csv'
require_relative 'transaction'

class CSVTransactionReader
  def initialize(file_path)
    @file_path = file_path
  end

  def read
    # we could use SmartCSV’s chunk feature to process in batches
    SmarterCSV.process(
      @file_path,
      headers_in_file: true, header_transformations: ->(h) { h.to_s.downcase.to_sym }
    ).map do |row|
      Transaction.new(
        id: row[:id],
        type: row[:tipo],
        amount: row[:monto]
      )
    end
  end
end
