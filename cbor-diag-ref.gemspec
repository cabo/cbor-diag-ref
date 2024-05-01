Gem::Specification.new do |s|
  s.name = "cbor-diag-ref"
  s.version = "0.0.1"
  s.summary = "CBOR (Concise Binary Object Representation) diagnostic notation"
  s.description = %q{cbor-diag-ref implements referencing for CBOR diagnostic notation}
  s.author = "Carsten Bormann"
  s.email = "cabo@tzi.org"
  s.license = "MIT"
  s.homepage = "http://cbor.io/"
  s.files = Dir['lib/**/*.rb'] + %w(cbor-diag-ref.gemspec) + Dir['bin/**/*.rb']
  s.executables = Dir['bin/**/*.rb'].map {|x| File.basename(x)}
  s.required_ruby_version = '>= 2.3'

  s.require_paths = ["lib"]

  s.add_development_dependency 'bundler', '~>1'
end
