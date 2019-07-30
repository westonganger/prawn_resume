lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prawn_resume/version"

Gem::Specification.new do |s|
  s.name          = "prawn_resume"
  s.version       = PrawnResume::VERSION
  s.authors       = ["Weston Ganger"]
  s.email         = ["weston@westonganger.com"]

  s.homepage 	= 'https://github.com/westonganger/prawn_resume'
  
  s.summary     = "Dead simple Prawn based PDF resume generator with support for custom resume templates"

  s.description = s.summary 

  s.files = Dir.glob("{lib/**/*}") + %w{ LICENSE README.md Rakefile CHANGELOG.md }
  s.test_files  = Dir.glob("{test/**/*}")
  s.require_path = 'lib'

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency "prawn"

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 5.0"
end
