require File.dirname(__FILE__) + '/app'

require 'sinatra/asset_pipeline/task'
Sinatra::AssetPipeline::Task.define! Web


require "sinatra/activerecord/rake"
namespace :db do
  task :load_config do
    require "./app"
  end
end

if RACK_ENV != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :specs do |task|
    task.pattern = Dir['spec/**/*_spec.rb']
  end

  task :default => ['specs']
end
