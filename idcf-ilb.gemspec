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

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "activesupport", ">= 4.2.3", "< 6"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.10"
end
