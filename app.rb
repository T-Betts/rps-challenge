require 'sinatra/base'

class RockPaperScissors < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/play' do
    'Hey Tom! Welcome to RPS'
  end
  run! if app_file == $0
end
