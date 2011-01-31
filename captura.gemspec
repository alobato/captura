# encoding: UTF-8
require File.expand_path("../lib/captura/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'captura'
  gem.version     = Captura::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.date        = Time.now.strftime('%Y-%m-%d')
  gem.authors     = ['@alobato']
  gem.summary     = 'Captura'
  gem.description = 'Captura'

  gem.files       = Dir['lib/**/*.rb', '*.md', 'Rakefile']
  gem.test_files  = Dir['test/**/*']

  gem.require_paths = ["lib"]

  gem.add_dependency('nokogiri')
end
