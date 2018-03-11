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
    $game = RPSGame.new(Player.new(session[:player_name]))
    erb(:play)
  end

  post '/rock_choice' do
    @game = $game
    session[:choice] = "rock"
    @game.player_1.move = session[:choice]
    redirect('result')
  end

  post '/paper_choice' do
    @game = $game
    session[:choice] = "paper"
    @game.player_1.move = session[:choice]
    redirect('result')
  end

  post '/scissors_choice' do
    @game = $game
    session[:choice] = "scissors"
    @game.player_1.move = session[:choice]
    redirect('result')
  end

  get '/result' do
    @game = $game
    @result = @game.play_rps
    erb(:result)
  end

  run! if app_file == $0
end
