def create_one_link_about_cats
  visit '/links/new'
  fill_in('title', with: 'Cats')
  fill_in('url', with: 'cats.com')
  fill_in('tag', with: 'pets')
  click_button('Submit')
end
