require "#{File.dirname(__FILE__)}/helper"

class SimplecovCsvFormatterTest < Test::Unit::TestCase
  def test_format
    SimpleCov.stubs( :coverage_path ).returns( "/tmp" )
    SimpleCov::Formatter::CSVFormatter.stubs( :result_file_name ).returns( 'coverage_test_results.csv' )
    if File.exists?( "/#{SimpleCov.coverage_path}/#{SimpleCov::Formatter::CSVFormatter.result_file_name}" )
      File.delete( "/#{SimpleCov.coverage_path}/#{SimpleCov::Formatter::CSVFormatter.result_file_name}" )
    end
        
    @original_result = {
      source_fixture( 'sample.rb' )                             => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
      source_fixture( 'app/models/user.rb' )                    => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
      source_fixture( 'app/controllers/sample_controller.rb' )  => [nil, 1, 1, 1, nil, nil, 0, 0, nil, nil]
    }

    @result = SimpleCov::Result.new(@original_result)
    csv_result = SimpleCov::Formatter::CSVFormatter.new().format( @result )
    
    File.readlines( source_fixture( 'results.csv' ) ).each do |line|
      assert_match( line.gsub( /^"\./, '' ), csv_result )
    end
    
    assert( File.exists?( "/#{SimpleCov.coverage_path}/#{SimpleCov::Formatter::CSVFormatter::RESULT_FILE_NAME}" ) )
  end
    
  def source_fixture( filename )
    File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', filename ) )
  end
end
