lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utopian_ruby/version'

Gem::Specification.new do |s|
  s.name        = 'utopian_ruby'
  s.version     = UtopianRuby::VERSION
  s.date        = '2018-01-11'
  s.summary     = "Utopian API ruby client"
  s.description = "Utopian API ruby client"
  s.authors     = ["Yuxi"]
  s.files       = ["lib/utopian_ruby.rb"]
  s.homepage    =
    'http://rubygems.org/gems/utopian_ruby'
  s.license       = 'MIT'

  s.add_dependency 'faraday'
  s.add_development_dependency 'rspec'
end
