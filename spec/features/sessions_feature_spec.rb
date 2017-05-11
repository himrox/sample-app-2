require 'rails_helper'

RSpec.feature 'UsersSignup', type: :feature do

  scenario 'ログインに失敗したらメッセージを表示すること' do
    visit login_path
    click_button 'Log in'
    expect(page).to have_selector '.alert'
    click_link 'Home'
    expect(page).not_to have_selector '.alert'
  end
end
