require "#{File.dirname(__FILE__)}/helper"

class SimplecovCsvFormatterTest < Test::Unit::TestCase
  def test_format
    SimpleCov.stubs( :coverage_path ).returns( "/tmp" )

    @original_result = {
      File.join(fixtures_path, 'sample.rb' )                             => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
      File.join(fixtures_path, 'app/models/user.rb' )                    => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
      File.join(fixtures_path, 'app/controllers/sample_controller.rb' )  => [nil, 1, 1, 1, nil, nil, 0, 0, nil, nil]
    }

    @result = SimpleCov::Result.new(@original_result)
    formatter = SimpleCov::Formatter::CSVMoreFormatter.new()
    formatter.format( @result )

    Dir[File.join(formatter.output_path, '*')].each do |output_file_path|
      fixture_path = File.join fixtures_path, File.basename(output_file_path)
      assert FileUtils.compare_file(fixture_path, output_file_path)
    end
  end

  def fixtures_path
    File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
  end
end
