require 'sinatra'
require_relative 'env' if File.exists?('env.rb')
require_relative 'bamboohr/user'

get '/' do
  Bamboohr::User.new.call
end
