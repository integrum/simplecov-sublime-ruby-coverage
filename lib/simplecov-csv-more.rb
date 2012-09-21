class SimpleCov::Formatter::CSVMoreFormatter
  RESULT_FILE_NAME = "more-results.csv"

  def format( result )
    data   = []
    data << ["File", "Line Number", "Covered"]

    result.files.each do |file|
      file.lines.each do |line|
        next if line.skipped?

        data << [ shortened_filename(file), line.number, line.covered? ]
      end
    end

    csv = data.map{|row| row.join(',')}.join("\n")

    result_file_path = File.join( SimpleCov.coverage_path, SimpleCov::Formatter::CSVMoreFormatter.result_file_name )
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
      SimpleCov::Formatter::CSVMoreFormatter::RESULT_FILE_NAME
    end
end
