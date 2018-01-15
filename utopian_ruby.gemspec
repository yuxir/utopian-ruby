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

  spec.add_dependency 'faraday'
  spec.add_development_dependency 'rspec'
end
