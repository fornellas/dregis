require_relative 'lib/dregis/version'

Gem::Specification.new do |s|
  s.name             = 'dregis'
  s.version          = DRegis::VERSION
  s.summary          = 'Docker Registry client'
  s.description      = 'Client for Docker Registry.'
  s.email            = 'fabio.ornellas@gmail.com'
  s.license          = 'GPL-3.0'
  s.homepage         = 'https://github.com/fornellas/dregis'
  s.authors          = ['Fabio Pugliese Ornellas']
  s.files            = Dir.glob('lib/**/*').keep_if{|p| not File.directory? p}
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options     = %w{--main README.md lib/ README.md}
  s.add_development_dependency 'rake', '~>10.4'
  s.add_development_dependency 'rdoc', '~>4.2'
  s.add_development_dependency 'rspec', '~>3.4'
  s.add_development_dependency 'simplecov', '~>0.11', '>=0.11.1'
end
