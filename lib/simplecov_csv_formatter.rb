class SimpleCov::Formatter::CSVFormatter
  RESULT_FILE_NAME = "results.csv"
  
  def format( result )
    csv = ""

    csv = "File,% covered,Lines,Relevant Lines,Lines covered,Lines missed\n"

    result.files.each do |file|
      csv << "\"#{shortened_filename file}\","
      csv << "#{file.covered_percent.round.to_s},"
      csv << "#{file.lines.count},"
      csv << "#{file.covered_lines.count + file.missed_lines.count},"
      csv << "#{file.covered_lines.count},"
      csv << "#{file.missed_lines.count}\n"
    end
    
    SimpleCov::Formatter::CSVFormatter.to_file( csv )
    
    return csv
  end
  
  private

    def self.to_file( csv )
      result_file_path = File.join( SimpleCov.coverage_path, SimpleCov::Formatter::CSVFormatter::RESULT_FILE_NAME )
    
      File.open( result_file_path, "w" ) do |file_result|
        file_result.write csv
      end  
    
      puts "Coverage report generated to #{result_file_path}"
    end
  
    def shortened_filename(source_file)
      source_file.filename.gsub(SimpleCov.root, '.')
    end
end