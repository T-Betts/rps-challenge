require 'spec_helper'
require_relative './web_helpers.rb'
require_relative '../../lib/player.rb'
require_relative '../../lib/rps_game.rb'

feature 'Entering player name' do
  scenario 'Can enter player name and see them on screen' do
    sign_in_and_play
    expect(page).to have_content("Hey Tom! Let's play RPS")
  end
end

feature 'Home page content' do
  scenario 'Shows header' do
    visit('/')
    expect(page).to have_content('Welcome to Rock, Paper, Scissors!!')
  end
end

feature 'Rock, Paper, Scissors gameplay' do
  let(:computer_double_rock) { double(:computer_double_rock) }
  let(:computer_move)        { 'Rocks' }
  scenario 'Displays rock button' do
    sign_in_and_play
    page.should have_selector(:link_or_button, 'Rock')
  end

  scenario 'Displays paper button' do
    sign_in_and_play
    page.should have_selector(:link_or_button, 'Paper')
  end

  scenario 'Displays scissors button' do
    sign_in_and_play
    page.should have_selector(:link_or_button, 'Scissors')
  end

  scenario 'Game can be drawn' do
    visit('/play')
    tom = Player.new("Tom")
    game = RPSGame.new(tom, computer_double_rock)
    click_button('Rock')
    expect(page).to have_content("It's a draw!")
  end
end
