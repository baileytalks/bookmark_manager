require './app/app.rb'

feature 'On the homepage, there should be a list of links' do
  scenario 'The homepage should load and contain links' do
    Link.create(url: 'www.cats.com', title: 'Cats')
    visit '/links'
    expect(page).to have_content 'Cats'
  end
end
