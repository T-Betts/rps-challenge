require 'spec_helper'
require_relative './web_helpers.rb'

feature 'Entering player name' do
  scenario 'Can enter player name and see them on screen' do
    sign_in_and_play
    expect(page).to have_content('Hey Tom! Welcome to RPS')
  end
end

feature 'Home page content' do
  scenario 'Shows header' do
    visit('/')
    expect(page).to have_content('Welcome to Rock, Paper, Scissors!!')
  end
end

feature 'Rock, Paper, Scissors gameplay' do
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
end
