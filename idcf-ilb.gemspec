lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idcf/ilb/version'

Gem::Specification.new do |spec|
  spec.name          = "idcf-ilb"
  spec.version       = Idcf::Ilb::VERSION
  spec.authors       = ["IDC Frontier Inc."]

  spec.summary       = %q{A Ruby client for IDCF Cloud ILB Service.}
  spec.homepage      = "http://www.idcf.jp/cloud/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15.3"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "rake", "~> 12.1"
  spec.add_development_dependency "rspec", "~> 3.6.0"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "activesupport", "~> 5.1.4"
  spec.add_dependency "faraday", "~> 0.9.2"
  spec.add_dependency "faraday_middleware", "~> 0.12.2"
end
