require './app/app.rb'

feature 'Allow users to submit a new link' do
  scenario 'Use a form to submit a new link' do
    visit '/links/new'
    fill_in('url', with: 'cats.com')
    click_button('Submit')
    expect(page).to have_content 'cats.com'
  end

  scenario 'Allow users to add a tag to a link' do
    visit '/links/new'
    fill_in('title', with: 'Cats')
    fill_in('url', with: 'cats.com')
    fill_in('tag', with: 'pets')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('pets')
  end
end
