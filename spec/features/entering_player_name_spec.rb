require 'spec_helper'

feature 'Entering player name' do
  scenario 'Can enter player name and see them on screen' do
    visit('/')
    fill_in('Player_1', with: 'Tom')
    click_button('Start')
    expect(page).to have_content('Hey Tom! Welcome to RPS')
  end
end
