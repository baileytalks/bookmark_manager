require './app/app.rb'

feature 'Filtering links by tag' do
  scenario 'A bubbles page lets a user see all links tagged with bubbles' do
    Link.create(url: 'www.cats.com', title: 'Cats', tag: 'bubbles')
    visit '/tags/bubbles'
    links = Link.all
    expect(links.tags.map(&:tag_name)).to eq('bubbles')
  end
end
