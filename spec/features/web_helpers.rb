def create_two_links_one_with_bubbles_one_without
  visit '/links/new'
  fill_in 'title', with: 'Cats and bubbles'
  fill_in 'url', with: 'cats.com/bubbles'
  fill_in 'tag', with: 'bubbles'
  click_button 'Submit'
  visit '/links/new'
  fill_in 'title', with: 'Cats without bubbles'
  fill_in 'url', with: 'cats.com'
  fill_in 'tag', with: 'cats'
  click_button 'Submit'
  visit '/tags/bubbles'
end

def create_one_link_about_cats
  visit '/links/new'
  fill_in('title', with: 'Cats')
  fill_in('url', with: 'cats.com')
  fill_in('tag', with: 'pets')
  click_button('Submit')
end
