# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uptimerobot-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "uptimerobot-ruby"
  gem.version       = UptimeRobot::Ruby::VERSION
  gem.authors       = ["Wouter Vancraeynest"]
  gem.email         = ["wouter.vancraeynest@by2.be"]
  gem.description   = %q{A ruby wrapper for Uptime Robot}
  gem.summary       = %q{A ruby wrapper for Uptime Robot}
  gem.homepage      = "https://github.com/woutervancraeynest/uptimerobot-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'httparty', '>= 0'
  gem.add_runtime_dependency 'awesome_print', '>= 0'

  gem.add_development_dependency 'rspec',    '~> 2.11.0'
end
