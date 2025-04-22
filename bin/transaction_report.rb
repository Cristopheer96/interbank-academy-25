# frozen_string_literal: true

require_relative '../lib/report_runner'

# script executable
if ARGV.empty?
  puts "Se debe señalar la ruta relativa del csv de esta maneraa : #{$PROGRAM_NAME} <path_to_csv>"
  exit 1
end

csv_file = ARGV.first
ReportRunner.new.run(csv_file)
