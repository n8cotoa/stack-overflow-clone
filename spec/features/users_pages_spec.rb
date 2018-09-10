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
end
