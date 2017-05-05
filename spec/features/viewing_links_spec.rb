require './app/app.rb'
require_relative 'web_helpers'

feature 'Viewing links' do
  scenario 'The homepage should load and contain links' do
    Link.create(url: 'www.cats.com', title: 'Cats')
    visit '/links'
    expect(page).to have_content 'Cats'
  end

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy',
                tags: [Tag.first_or_create(tag: 'education')])

    Link.create(url: 'http://www.google.com', title: 'Google',
                tags: [Tag.first_or_create(tag: 'search')])

    Link.create(url: 'http://www.zombo.com', title: 'Zombocom',
                tags: [Tag.first_or_create(tag: 'bubbles')])

    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble',
                tags: [Tag.first_or_create(tag: 'bubbles')])
  end

  scenario 'User can filter links by tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
