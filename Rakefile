require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  #t.test_files = FileList["test/**/*_test.rb"]
  t.test_files = FileList["test/**/*_test.rb"] + ['test/script.rb']
end

task :default => :test

task :console do
  require 'prawn_resume'

  require 'irb'
  binding.irb
end
