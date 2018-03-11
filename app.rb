require 'sinatra/base'

class RockPaperScissors < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/name' do
    session[:player_name] = params[:Player_name]
    redirect('play')
  end

  get '/play' do
    @player = session[:player_name]
    "Hey #{@player}! Welcome to RPS"
  end

  run! if app_file == $0
end
