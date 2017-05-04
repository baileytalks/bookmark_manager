require './app/app.rb'
require_relative 'web_helpers'

feature 'Filtering links by tag' do
  scenario 'Page exists only to show links tagged with bubbles if tag exists' do
    create_two_links_one_with_bubbles_one_without
    expect(page).to have_content('bubbles')
  end
  scenario 'A bubbles page shows links tagged with bubbles' do
    create_two_links_one_with_bubbles_one_without
    expect(page).to have_content 'Cats and bubbles'
  end
  scenario 'A bubbles page does not show links without bubbles tag' do
    create_two_links_one_with_bubbles_one_without
    expect(page).not_to have_content 'Cats without bubbles'
  end
end
