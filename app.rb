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
    erb(:play)
  end

  post '/rock_choice' do
    session[:choice] = "rock"
    redirect('result')
  end

  post '/paper_choice' do
    session[:choice] = "paper"
    redirect('result')
  end

  post '/scissors_choice' do
    session[:choice] = "scissors"
    redirect('result')
  end

  get '/result' do
    @choice = session[:choice]
    erb(:result)
  end

  run! if app_file == $0
end
