# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_comparable/version'

Gem::Specification.new do |spec|
  spec.name          = "image_comparable"
  spec.version       = ImageComparable::VERSION
  spec.authors       = ["Wellington Avelino"]
  spec.email         = ["wellington.avelino@outlook.com"]

  spec.summary       = %q{A gem to make visual test}
  spec.description   = %q{An easy way to create your visual regression tests}
  spec.homepage      = "https://github.com/wellavelino/image-comparable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "chunky_png", ">= 1.3.8"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "bundler", "~> 1.14"
end
