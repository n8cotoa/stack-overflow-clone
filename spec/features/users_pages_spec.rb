require 'rails_helper'

describe 'the user Sign Up Process' do
  it 'creates a user' do
    visit '/signup'
    fill_in 'user_email', :with => 'rita@mail.com'
    fill_in 'user_name', :with => 'ritabc'
    fill_in 'user_password', :with => 'password321'
    fill_in 'user_password_confirmation', :with => 'password321'
    click_button 'Sign Up'
    expect(page).to have_content("successfully")
  end

  it 'unsuccessfully creates a user' do
    visit '/signup'
    fill_in 'user_email', :with => 'rita@mail.com'
    fill_in 'user_name', :with => ''
    fill_in 'user_password', :with => 'password321'
    fill_in 'user_password_confirmation', :with => 'password321'
    click_button 'Sign Up'
    expect(page).to have_content("problem")
  end

  it 'signs a user in and goes to user page' do
    test_user = FactoryBot.create(:user)
    visit '/signin'
    fill_in 'email', :with => 'Test@test.com'
    fill_in 'password', :with => 'Password123'
    click_button 'Sign in'
    visit user_path(test_user)
    expect(page).to have_content("Test Username")
  end
end
