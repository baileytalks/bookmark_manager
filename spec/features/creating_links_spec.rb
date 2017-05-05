require './app/app.rb'
require_relative 'web_helpers'

feature 'Creating links' do
  scenario 'Use a form to submit a new link' do
    create_one_link_about_cats
    expect(page).to have_content 'cats.com'
  end

  scenario 'Allow users to add a tag to a link' do
    create_one_link_about_cats
    link = Link.first
    expect(link.tags.map(&:tag)).to include('pets')
  end

  scenario 'Allow users to add two tags to a link' do
    create_one_link_with_two_tags
    link = Link.first
    expect(link.tags.map(&:tag)).to include('pets')
  end
end
