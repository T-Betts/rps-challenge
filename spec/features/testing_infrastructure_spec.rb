require 'spec_helper'

feature 'Entering player name' do
  scenario 'Can enter player name and see them on screen' do
    visit('/')
    expect(page).to have_content('Welcome to RPS')
  end
end
