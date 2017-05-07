require 'rails_helper'

RSpec.feature 'Site layout', type: :feature do
  feature 'Layout links' do

    scenario 'ページのリンクが正しいこと' do
      visit root_path
      expect(page).to have_link('sample app', href: root_path)
      expect(page).to have_link('Home', href: root_path)
      expect(page).to have_link('Help', href: help_path)
      expect(page).to have_link('About', href: about_path)
      expect(page).to have_link('Contact', href: contact_path)
    end

  end
end
