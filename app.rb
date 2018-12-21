ENV["RACK_ENV"] ||= 'development'

require './config/datamapper'
require 'rubygems'
require 'sinatra/base'
require './lib/message'
require 'pry'

class Messenger < Sinatra::Base

  set :sessions, true

  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/new_message' do
    Message.create(content: params[:message])
    redirect '/'
  end

  get '/messages/:id' do
    @message = Message.get(params[:id])
    erb(:full_message)
  end

  run! if app_file == $PROGRAM_NAME
end
