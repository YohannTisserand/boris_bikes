require 'rspec/core/rake_task'
require 'rake'

Rspec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
  task.rspec_opts - '--format documentation'
end

task :default => [:spec]
