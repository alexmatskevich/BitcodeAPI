# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crypt_api/version'

Gem::Specification.new do |spec|
  spec.name          = "crypt-api"
  spec.version       = CryptApi::VERSION
  spec.authors       = ["Alexey"]
  spec.email         = ["41exmackevich@gmail.com"]
  spec.summary       = %q{Api}
  spec.description   = %q{The gem sending an encrypted request to the specified address and decrypting of the received response.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
