require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/rps_game.rb'

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
    @game = RPSGame.create(Player.new(session[:player_name]))
    erb(:play)
  end

  post '/rock_choice' do
    @game = RPSGame.instance
    session[:choice] = "rock"
    @game.player_1.move = session[:choice]
    redirect('result')
  end

  post '/paper_choice' do
    @game = RPSGame.instance
    session[:choice] = "paper"
    @game.player_1.move = session[:choice]
    redirect('result')
  end

  post '/scissors_choice' do
    @game = RPSGame.instance
    session[:choice] = "scissors"
    @game.player_1.move = session[:choice]
    redirect('result')
  end

  get '/result' do
    @game = RPSGame.instance
    @result = @game.play_rps
    erb(:result)
  end

  run! if app_file == $0
end
