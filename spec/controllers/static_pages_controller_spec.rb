require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  render_views

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "タイトルが「Home | Ruby on Rails Tutorial Sample App」であること" do
      get :home
      expect(response.body).to have_title 'Home | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    it "タイトルが「Help | Ruby on Rails Tutorial Sample App」であること" do
      get :help
      expect(response.body).to have_title 'Help | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "タイトルが「About | Ruby on Rails Tutorial Sample App」であること" do
      get :about
      expect(response.body).to have_title 'About | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end

    it "タイトルが「Contact | Ruby on Rails Tutorial Sample App」であること" do
      get :contact
      expect(response.body).to have_title 'Contact | Ruby on Rails Tutorial Sample App'
    end
  end

end
