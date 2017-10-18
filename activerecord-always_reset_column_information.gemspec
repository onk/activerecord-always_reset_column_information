# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activerecord/always_reset_column_information/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-always_reset_column_information"
  spec.version       = Activerecord::AlwaysResetColumnInformation::VERSION
  spec.authors       = ["Takafumi ONAKA"]
  spec.email         = ["takafumi.onaka@gmail.com"]

  spec.summary       = "Call Model.reset_column_information for each migrations"
  spec.description   = "Call Model.reset_column_information for each migrations"
  spec.homepage      = "https://github.com/onk/activerecord-always_reset_column_information"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end
