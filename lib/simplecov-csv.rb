class SimpleCov::Formatter::CSVFormatter
  RESULT_FILE_NAME = "results.csv"
  
  def format( result )
    csv = "File,% covered,Lines,Relevant Lines,Lines covered,Lines missed\n"

    result.files.each do |file|
      csv << "\"#{shortened_filename file}\","
      csv << "#{file.covered_percent.round.to_s},"
      csv << "#{file.lines.count},"
      csv << "#{file.covered_lines.count + file.missed_lines.count},"
      csv << "#{file.covered_lines.count},"
      csv << "#{file.missed_lines.count}\n"
    end
    
    result_file_path = File.join( SimpleCov.coverage_path, SimpleCov::Formatter::CSVFormatter.result_file_name )
    File.open( result_file_path, "w" ) do |file_result|
      file_result.write csv
    end
    puts "Coverage report generated for #{result.command_name} to #{result_file_path}"
    
    return csv
  end
  
  private
  
    def shortened_filename(source_file)
      source_file.filename.gsub(SimpleCov.root, '.')
    end
    
    def self.result_file_name
      SimpleCov::Formatter::CSVFormatter::RESULT_FILE_NAME
    end
end