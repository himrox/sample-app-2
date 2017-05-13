require 'rails_helper'

RSpec.feature 'UsersLogin', type: :feature do

  before do
    @user = FactoryGirl.create(:user)
  end

  scenario '正しい情報を入力したらログインし、その後ログアウトすること' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(current_path).to eq user_path(@user.id)
    expect(page).to have_link('Log out', href: logout_path)
    expect(page).to have_link('Profile', href: user_path(@user.id))
    expect(page).not_to have_link('Log in', href: login_path)

    click_link 'Log out'
    expect(current_path).to eq root_path
    expect(page).not_to have_link('Log out', href: logout_path)
    expect(page).not_to have_link('Profile', href: user_path(@user.id))
    expect(page).to have_link('Log in', href: login_path)
  end

  scenario 'Remember meをチェックしてログインする' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    check 'Remember me on this computer'
    click_button 'Log in'
    expect(Capybara.current_session.driver.request.cookies.[]('remember_token')).not_to eq nil
  end

  scenario 'Remember meのチェックを外してログインする' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    uncheck 'Remember me on this computer'
    click_button 'Log in'
    expect(Capybara.current_session.driver.request.cookies.[]('remember_token')).to eq nil
  end
end
