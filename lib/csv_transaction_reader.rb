# frozen_string_literal: true

require 'smarter_csv'
require_relative 'transaction'

# class responsible for reading the CSV, converting each line into a Transaction object, and returning an Transactions
class CSVTransactionReader
  def initialize(file_path)
    @file_path = file_path
  end

  def read
    transactions = []
    # we could use SmartCSV's chunk feature to process in batches
    SmarterCSV.process(
      @file_path,
      headers_in_file: true,
      header_transformations: ->(h) { h.to_s.downcase.to_sym }
    ).each_with_index do |row, index|
      transactions << Transaction.new(
        id: row[:id],
        type: row[:tipo],
        amount: row[:monto]
      )
    rescue ArgumentError => e
      puts "Error in row #{index + 1}: #{e.message}"
    end
    transactions
  end
end
