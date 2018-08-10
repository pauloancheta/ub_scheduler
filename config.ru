require 'rubygems'
require 'bundler'

Bundler.require

require './app'
require './env' if File.exists?('env.rb')
Dir["./bamboohr/*.rb"].each {|file| require file }
Dir["./ops_genie/*.rb"].each {|file| require file }

run App
