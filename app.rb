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
    erb :index
  end

  post '/newmessage' do
    Message.create(content: params[:message], tag: params[:tag])
    redirect '/'

  end

  get '/messages/:id' do
    @messages = Message.all
    @message = Message.get(params[:id])
    erb(:full_message)
  end

  get '/tags/:tag' do
    @messages = Message.all
    erb(:tagged_msgs)
  end

  delete '/:id' do
    connection = PG.connect(dbname: "message_app_#{ENV["RACK_ENV"]}")
    connection.exec("DELETE FROM messages WHERE id = #{params['id']}")
    redirect '/'
  end

  get '/:id/update' do
    @messages = Message.all
    @message_id = params[:id]
    @message = Message.get(params[:id])
    erb(:edit)
  end

  patch '/:id' do
    connection = PG.connect(dbname: "message_app_#{ENV["RACK_ENV"]}")
    connection.exec("UPDATE messages SET (content, tag) = ('#{params[:message]}', '#{params[:tag]}') WHERE id = '#{params[:id]}'")
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
