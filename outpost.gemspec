# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'outpost/version'

Gem::Specification.new do |gem|
  gem.name          = "outpost"
  gem.version       = Outpost::VERSION
  gem.authors       = ["Zac"]
  gem.email         = ["zac@kleinpeter.org"]
  gem.description   = %q{
    The Outpost is a chess meta engine.  That means it will preform all the
    heavy calculations that are required of a chess engine, but it will NOT tell
    you where to play your pieces.  Instead this is the job of an different computer
    algorithm.

    Requirements for this engine:
      * Distributed ( drb initially )
      * Fast ( some C might be needed )
      * Calculation of rules
      * 960 required
   }
  gem.summary       = %q{Meta Chess engine}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]


  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'autotest'
end
