require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:unit) do |t|
  t.rspec_opts = ['--color', '--format progress']
end

Cucumber::Rake::Task.new(:acceptance) do |t|
  t.cucumber_opts = ['--color', '--format progress', '--strict']
end

desc 'Run all tests'
task test: [:unit, :acceptance]

task default: [:test]
