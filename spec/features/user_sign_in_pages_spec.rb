require 'rails_helper'


describe 'sign on page' do
  it 'signs a user in' do
    test_user = FactoryBot.create(:user)
    visit '/signin'
    fill_in 'email', :with => 'Test@test.com'
    fill_in 'password', :with => 'Password123'
    click_button 'Sign in'
    expect(page).to have_content("You've signed in.")
  end

  it 'fails to sign a user in' do
    test_user = FactoryBot.create(:user)
    visit '/signin'
    fill_in 'email', :with => ''
    fill_in 'password', :with => 'Password123'
    click_button 'Sign in'
    expect(page).to have_content("There was a problem signing in.")
  end

  it 'signs a user out' do
    test_user = FactoryBot.create(:user)
    visit '/signin'
    fill_in 'email', :with => 'Test@test.com'
    fill_in 'password', :with => 'Password123'
    click_button 'Sign in'
    click_on 'Sign out'
    expect(page).to have_content("You've signed out.")
  end


end
