def create_one_link_about_cats
  visit '/links/new'
  fill_in('title', with: 'Cats')
  fill_in('url', with: 'cats.com')
  fill_in('tags', with: 'pets')
  click_button('Submit')
end

def create_one_link_with_two_tags
  visit '/links/new'
  fill_in('title', with: 'Cats')
  fill_in('url', with: 'cats.com')
  fill_in('tags', with: 'pets, cats')
  click_button('Submit')
end
