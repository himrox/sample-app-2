require 'rails_helper'

RSpec.feature 'UsersSignup', type: :feature do

  scenario '不正な値が入力された場合、ユーザーを登録しないこと' do
    visit root_path
    expect{
      click_link 'Sign up now!'
      fill_in 'Name', with: 'Sample User'
      click_button 'Create my account'
    }.not_to change(User, :count)
    expect(page).to have_selector '#error_explanation'
    expect(page).to have_selector '.alert'
    expect(current_path).to eq signup_path
    expect(page).to have_selector 'form[action="/signup"]'
  end

  scenario '正しい値が入力された場合、ユーザーを登録すること' do
    user = FactoryGirl.build(:user)
    visit root_path
    expect{
      click_link 'Sign up now!'
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Confirmation', with: user.password
      click_button 'Create my account'
    }.to change(User, :count).by(1)
    expect(page).to have_selector '.alert'
    expect(page).to have_selector '.alert-success'
    user = User.find_by(email: user.email)
    expect(current_path).to eq user_path(user.id)
    expect(page).to have_link('Log out', href: logout_path)
    expect(page).to have_link('Profile', href: user_path(user.id))
    expect(page).not_to have_link('Log in', href: login_path)
  end
end
