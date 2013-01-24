# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uptimerobot-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "uptimerobot-ruby"
  gem.version       = Uptimerobot::Ruby::VERSION
  gem.authors       = ["Wouter Vancraeynest"]
  gem.email         = ["wouter.vancraeynest@by2.be"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
