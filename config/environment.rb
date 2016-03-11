RACK_ENV ||= ENV["RACK_ENV"] || "development"

require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

require_all 'app'

dbconfig = YAML.load(ERB.new(File.read("config/database.yml")).result)

# YOU MUST SET THE ENV RACK_ENV to 'production' FOR YOUR CATRIDGE
ActiveRecord::Base.establish_connection dbconfig[RACK_ENV]

if ENV["OPENSHIFT_RUBY_LOG_DIR"]
	LOG_FILE = "#{ENV["OPENSHIFT_RUBY_LOG_DIR"]}/#{RACK_ENV}.log"
	ActiveRecord::Base.logger = Logger.new(File.open(LOG_FILE, 'a+'))
else
	Dir.mkdir('log') if !File.exist?('log') || !File.directory?('log')
	ActiveRecord::Base.logger = Logger.new(File.open("log/#{RACK_ENV}.log", "a+"))
end
