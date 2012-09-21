require 'fileutils'
require 'pathname'

class SimpleCov::Formatter::CSVMoreFormatter

  def format(result)

    @path_relativizer = Hash.new{|h,base|
      h[base] = Pathname.new(base).cleanpath.to_s.gsub(%r{^\w:[/\\]}, "").gsub(/\./, "_").gsub(/[\\\/]/, "-") + ".csv"
    }

    FileUtils.mkdir_p output_path

    result.files.each do |file|
      data = []
      data << ["Covered"]

      file.lines.each do |line|
        data << [line.covered?]
      end

      csv = data.map{|row| row.join(',')}.join("\n")


      result_file_path = File.join(output_path, relative_filename(shortened_filename(file)))
      File.open(result_file_path, "w") do |file_result|
        file_result.write csv
      end
    end

    puts "Coverage report generated for #{result.command_name} to #{output_path}"
  end

  def output_path
    File.join SimpleCov.coverage_path, 'csv-more'
  end

  private

  def relative_filename(path)
    @path_relativizer[path]
  end

  def shortened_filename(source_file)
    source_file.filename.gsub(SimpleCov.root, '.')
  end
end
