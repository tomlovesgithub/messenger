require_relative 'app.rb'
require 'data_mapper'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

task default: [:spec]

namespace :db do
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete"
  end

  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete"
  end
end
