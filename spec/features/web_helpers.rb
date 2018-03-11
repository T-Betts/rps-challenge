def sign_in_and_play
  visit('/')
  fill_in('Player_name', with: 'Tom')
  click_button('Start')
end
