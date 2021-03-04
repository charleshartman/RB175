# dynamic_directory_index.rb

require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  sort = params[:sort]
  @title = "Files"

  if sort == "a" || sort.nil?
    @contents = Dir.glob("public/*").sort
  elsif sort == "z"
    @contents = Dir.glob("public/*").sort.reverse
  end

  erb :home
end
