require './app/app.rb'

feature 'Allow users to submit a new link' do
  scenario 'Use a form to submit a new link' do
    create_one_link_about_cats
    expect(page).to have_content 'cats.com'
  end

  scenario 'Allow users to add a tag to a link' do
    create_one_link_about_cats
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('pets')
  end
end
