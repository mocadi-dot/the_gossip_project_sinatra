require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base
  get '/' do
  erb :index
end

  run! if app_file == $0
end
