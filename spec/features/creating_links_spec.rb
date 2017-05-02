require './app/app.rb'

feature 'Allow users to submit a new link' do
  scenario 'Use a form to submit a new link' do
    visit '/links/new'
    fill_in('url', with: 'google.com')
    click_button('Submit')
    expect(page).to have_content 'google.com'
  end
end
