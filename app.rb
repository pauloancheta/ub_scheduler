require 'sinatra'
require_relative 'bamboohr/user.rb'

get '/' do
  Bamboohr::User.new.call
end
