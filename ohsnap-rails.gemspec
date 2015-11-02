# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ohsnap/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "ohsnap-rails"
  spec.version       = Ohsnap::Rails::VERSION
  spec.authors       = ["Rahul Lakhaney"]
  spec.email         = ["rahul.lakhaney@gmail.com"]

  spec.summary       = %q{Ruby gem for ohsnap.}
  spec.description   = %q{Ruby gem for ohsnap. A simple notification jQuery/Zepto library designed to be used in mobile apps}
  spec.homepage      = "https://github.com/rahullakhaney/ohsnap-rails"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
