lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utopian_ruby/version'

Gem::Specification.new do |s|
  s.name        = 'utopian_ruby_api'
  s.version     = UtopianRuby::VERSION
  s.date        = '2018-01-11'
  s.summary     = "Utopian API ruby client"
  s.description = "Utopian API ruby client, providing information about Utopian.io moderators, sponsors, posts, stats etc"
  s.authors     = ["Yuxi"]
  s.files       = ["lib/utopian_ruby_api.rb"]
  s.homepage    =
    'http://rubygems.org/gems/utopian_ruby_api'
  s.license       = 'MIT'

  s.add_runtime_dependency 'faraday', '~> 0.13'
  s.add_runtime_dependency 'addressable', '~> 2.5'
  s.add_development_dependency 'rspec', '~> 3.7'
end
