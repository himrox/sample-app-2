require 'rails_helper'

feature 'StaticPagesFeature' do

  scenario '正しいタイトルが表示されること' do
    visit root_path
    expect(page.title).to match(/\ARuby on Rails Tutorial Sample App\z/)

    visit static_pages_home_path
    expect(page.title).to match(/\ARuby on Rails Tutorial Sample App\z/)

    visit static_pages_help_path
    expect(page.title).to match(/\AHelp | Ruby on Rails Tutorial Sample App\z/)

    visit static_pages_about_path
    expect(page.title).to match(/\AAbout | Ruby on Rails Tutorial Sample App\z/)

    visit static_pages_contact_path
    expect(page.title).to match(/\AContact | Ruby on Rails Tutorial Sample App\z/)
  end

end
