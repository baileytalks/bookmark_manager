require './app/app.rb'
require_relative 'web_helpers'

feature 'User signup' do
  scenario 'Views a form, fills it in and submits the form' do
    signup
    expect(page).to have_current_path('/links')
  end

  scenario 'The links page has a welcome message' do
    signup
    expect(page).to have_content('Welcome')
  end

  scenario 'The user email is displayed on the links page' do
    signup
    expect(page).to have_content('bailey@gmail.com')
  end

  scenario 'Check that the user count increases by 1' do
    expect { signup }.to change { User.count }.by(1)
  end
end
