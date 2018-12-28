ENV["RACK_ENV"] ||= 'development'

require './config/datamapper'
require 'rubygems'
require 'sinatra/base'
require './lib/message'
require 'pry'

class Messenger < Sinatra::Base

  enable :sessions, :method_override

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

  delete '/:id' do
    connection = PG.connect(dbname: "message_app_#{ENV["RACK_ENV"]}")
    connection.exec("DELETE FROM messages WHERE id = #{params['id']}")
    redirect '/'
  end

  get '/:id/update' do
    @message_id = params[:id]
    erb(:edit)
  end

  patch '/:id' do
    connection = PG.connect(dbname: "message_app_#{ENV["RACK_ENV"]}")
    connection.exec("UPDATE messages SET content = '#{params[:message]}' WHERE id = '#{params[:id]}'")
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
