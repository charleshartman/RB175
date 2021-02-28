# dynamic_directory_index.rb

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "Files"
  @contents = Dir.glob("public/*")

  erb :home
end
