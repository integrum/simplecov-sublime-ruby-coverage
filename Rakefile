require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('simplecov_csv_formatter', '0.1.0') do |p|  
  p.description     = "CSV formatter for SimpleCov"  
  p.url             = "http://github.com/eifion/uniquify"  
  p.author          = "Eifion Bedford"  
  p.email           = "eifion@asciicasts.com"  
  p.ignore_pattern  = ["tmp/*", "script/*"]  
  p.development_dependencies = []  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }