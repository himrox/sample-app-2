require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  feature 'UsersFeature' do

    scenario '正しいタイトルが表示されること' do
      visit signup_path
      expect(page.title).to match(/\ASign up | Ruby on Rails Tutorial Sample App\z/)
    end

  end
end
