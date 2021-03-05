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

helpers do
  def count_interests
    @user_count = 0
    @interest_count = 0
    @users.each_value do |value|
      @user_count += 1
      @interest_count += value[:interests].count
    end
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  @title = "Users"
  erb :users
end

get "/:user_name" do
  @user_name = params[:user_name].to_sym
  @title = @user_name
  @email = @users[@user_name][:email]
  @interests = @users[@user_name][:interests]

  erb :user
end

not_found do
  redirect "/"
end
