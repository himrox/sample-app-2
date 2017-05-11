require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "homeテンプレートを表示すること" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "GET #help" do
    it "helpテンプレートを表示すること" do
      get :help
      expect(response).to render_template(:help)
    end
  end

  describe "GET #about" do
    it "aboutテンプレートを表示すること" do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe "GET #contact" do
    it "contactテンプレートを表示すること" do
      get :contact
      expect(response).to render_template(:contact)
    end
  end

end
