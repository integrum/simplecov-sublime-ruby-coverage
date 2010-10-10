require "#{File.dirname(__FILE__)}/helper"

class SimplecovCsvFormatterTest < Test::Unit::TestCase
  def test_format
    @original_result = {
      source_fixture( 'sample.rb' )                             => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
      source_fixture( 'app/models/user.rb' )                    => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
      source_fixture( 'app/controllers/sample_controller.rb' )  => [nil, 1, 1, 1, nil, nil, 0, 0, nil, nil]
    }

    @result = SimpleCov::Result.new(@original_result)
    
    csv_fixture = File.read( source_fixture( 'results.csv' ) )
    SimpleCov::Formatter::CSVFormatter.expects( :to_file ).with( csv_fixture )
    assert_equal( csv_fixture, SimpleCov::Formatter::CSVFormatter.new().format( @result ) )
  end
  
  def test_to_file
    SimpleCov.expects( :coverage_path ).returns( "/tmp" )
    
    SimpleCov::Formatter::CSVFormatter.send( :to_file, "wadus content" )
    assert_equal( "wadus content", File.read( "/tmp/#{SimpleCov::Formatter::CSVFormatter::RESULT_FILE_NAME}" ) )
  end
  
  def source_fixture( filename )
    File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', filename ) )
  end
end
