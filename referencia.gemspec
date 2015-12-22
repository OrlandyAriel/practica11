# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'referencia/version'

Gem::Specification.new do |spec|
  spec.name          = "referencia-cita-prct11"
  spec.version       = Referencia::VERSION
  spec.authors       = ["Orlandy Ariel"]
  spec.email         = ["alu0100773408@ull.edu.es"]

  if spec.respond_to?(:metadata)
   # spec.metadata['allowed_push_host'] = ""
  end

  spec.summary       = %q{"Referencia Blibliografica"}
  spec.description   = %q{"Referencia Blibliografica"}
  spec.homepage      =""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
  spec.add_development_dependency "guard"
	spec.add_development_dependency "guard-rspec"
	spec.add_development_dependency "guard-bundler"
	spec.add_development_dependency "coveralls"
end
