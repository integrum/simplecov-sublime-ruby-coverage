# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simplecov-csv-more"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Integrum Dudes http://integrumtech.com"]
  s.date = "2012-09-21"
  s.description = "CSV (and more!) formatter for SimpleCov"
  s.email = "everyone+github@integrumtech.com"
  s.extra_rdoc_files = ["README.rdoc", "lib/simplecov-csv-more.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "lib/simplecov-csv-more.rb", "simplecov-csv-more.gemspec", "test/fixtures/app/controllers/sample_controller.rb", "test/fixtures/app/models/user.rb", "test/fixtures/results.csv", "test/fixtures/sample.rb", "test/helper.rb", "test/simplecov-csv-more_test.rb"]
  s.homepage = "http://github.com/integrum/simplecov-csv-more"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simplecov-csv-more", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "simplecov-csv-more"
  s.rubygems_version = "1.8.24"
  s.summary = "CSV (and more!) formatter for SimpleCov"
  s.test_files = ["test/simplecov-csv-more_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
