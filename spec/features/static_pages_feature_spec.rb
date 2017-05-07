require 'rails_helper'

RSpec.feature 'Static pages', type: :feature do
  feature 'StaticPagesFeature' do

    scenario '正しいタイトルが表示されること' do
      visit root_path
      expect(page.title).to match(/\ARuby on Rails Tutorial Sample App\z/)

      visit help_path
      expect(page.title).to match(/\AHelp | Ruby on Rails Tutorial Sample App\z/)

      visit about_path
      expect(page.title).to match(/\AAbout | Ruby on Rails Tutorial Sample App\z/)

      visit contact_path
      expect(page.title).to match(/\AContact | Ruby on Rails Tutorial Sample App\z/)
    end

  end
end
