# frozen_string_literal: true

require_relative 'csv_transaction_reader'
require_relative 'transaction_analyzer'
require_relative 'report_formatter'

# Flow orchestrator class
class ReportRunner
  def initialize(
    reader:    CSVTransactionReader,
    analyzer:  TransactionAnalyzer,
    formatter: ReportFormatter
  )
    @reader_class    = reader
    @analyzer_class  = analyzer
    @formatter_class = formatter
  end

  # Run the full workflow given a CSV file path
  def run(file_path)
    transactions = @reader_class.new(file_path).read
    analyzer     = @analyzer_class.new(transactions)
    formatter    = @formatter_class.new(analyzer)
    formatter.print
  rescue StandardError => e
    puts "An unexpected error occurred: #{e.message}"
  end
end
