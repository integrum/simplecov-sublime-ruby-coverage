# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simplecov-sublime-ruby-coverage"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Integrum Dudes http://integrumtech.com"]
  s.date = "2012-09-24"
  s.description = "Sublime Ruby Coverage formatter for SimpleCov"
  s.email = "everyone+github@integrumtech.com"
  s.extra_rdoc_files = ["README.rdoc", "lib/simplecov-csv-more.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "lib/simplecov-csv-more.rb", "simplecov-csv-more.gemspec", "test/fixtures/app/controllers/sample_controller.rb", "test/fixtures/app/models/user.rb", "test/fixtures/sample.rb", "test/fixtures/test-fixtures-app-controllers-sample_controller_rb.csv", "test/fixtures/test-fixtures-app-models-user_rb.csv", "test/fixtures/test-fixtures-sample_rb.csv", "test/helper.rb", "test/simplecov-csv-more_test.rb", "simplecov-sublime-ruby-coverage.gemspec", "test/simplecov-sublime-ruby-coverage_test.rb"]
  s.homepage = "http://github.com/integrum/simplecov-sublime-ruby-coverage"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simplecov-sublime-ruby-coverage", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "simplecov-sublime-ruby-coverage"
  s.rubygems_version = "1.8.24"
  s.summary = "Sublime Ruby Coverage formatter for SimpleCov"
  s.test_files = ["test/simplecov-sublime-ruby-coverage_test.rb"]

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
