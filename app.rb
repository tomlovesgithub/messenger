require 'sinatra/base'
require './lib/message.rb'
class Messenger < Sinatra::Base

  enable :sessions

  get '/' do
    session[:message] ||= []
    @message = session[:message]
    erb(:index)
  end

  post '/new_message' do
    message = Message.new(params[:message])
    session[:message] << message
    redirect '/'
  end

  run! if app_file == $0
end
