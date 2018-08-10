require 'sinatra'
require 'http'
require 'ox'
require 'byebug'

require_relative 'env' if File.exists?('env.rb')
Dir["./bamboohr/*.rb"].each {|file| require file }

get '/' do
  Bamboohr::User.new.all
end
