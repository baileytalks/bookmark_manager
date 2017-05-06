def create_one_link_about_cats
  visit '/links/new'
  expect(page.status_code).to eq(200)
  fill_in('title', with: 'Cats')
  fill_in('url', with: 'cats.com')
  fill_in('tags', with: 'pets')
  click_button('Submit')
end

def create_one_link_with_two_tags
  visit '/links/new'
  expect(page.status_code).to eq(200)
  fill_in('title', with: 'Cats')
  fill_in('url', with: 'cats.com')
  fill_in('tags', with: 'pets, cats')
  click_button('Submit')
end

def signup
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in('email', with: 'bailey@gmail.com')
  fill_in('password', with: 'password1')
  click_button('Signup')
end
