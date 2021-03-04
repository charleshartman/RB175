# users_and_interests.rb

require "bundler/setup"
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

# The part you need to know for this challenge is how to read a YAML file in
# and convert it into a Ruby object, which is provided by the Psych.load_file
# method. Since YAML == Psych, you can use YAML.load_file, which is more
# conventional.

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do
  redirect "/users"
end

get "/users" do
  @title = "Users"
  erb :users
end

# not_found do
#   redirect "/"
# end
