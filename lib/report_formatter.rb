# frozen_string_literal: true

# Formats and prints the transaction report to the console
class ReportFormatter
  def initialize(analyzer)
    @analyzer = analyzer
  end

  # Outputs the full report
  def print
    highest = @analyzer.highest_transaction
    counts_line = @analyzer.count_by_type.map { |type, quantity| "#{type}: #{quantity}" }.join(' ')

    puts "
      Reporte de Transacciones
      ---------------------------------------------
      Balance Final: #{@analyzer.final_balance}
      Transacción de Mayor Monto: ID => #{highest.id} // Monto =>#{highest.amount}
      Conteo de Transacciones: #{counts_line}
    "
  end
end
