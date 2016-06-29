# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/releases/notification/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-releases-notification"
  spec.version       = Capistrano::Releases::Notification::VERSION
  spec.authors       = ["kimromi"]
  spec.email         = ["hiromi19860101@gmail.com"]

  spec.summary       = %q{gitHub release and slack notification for Capistrano v3}
  spec.description   = %q{gitHub Release and slack notification for Capistrano v3}
  spec.homepage      = "https://github.com/kimromi/capistrano-releases-notification"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", ">= 3.1"
  spec.add_dependency "capistrano-github-releases"
  spec.add_dependency "capistrano-slack_notification"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
