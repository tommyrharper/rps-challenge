def enter_name
  visit('/')
  fill_in :name, with: 'Tom'
  click_button 'Submit'
end

def choose_scissors
  enter_name
  click_button 'Scissors'
end
