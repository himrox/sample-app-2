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
    visit root_path
    expect{
      click_link 'Sign up now!'
      fill_in 'Name', with: 'Sample User'
      fill_in 'Email', with: 'sample@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Confirmation', with: 'password'
      click_button 'Create my account'
    }.to change(User, :count).by(1)
    expect(page).to have_selector '.alert'
    expect(page).to have_selector '.alert-success'
    user = User.last
    expect(current_path).to eq user_path(user.id)
  end
end
