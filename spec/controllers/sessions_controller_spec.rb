require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "newテンプレートを表示すること" do
      get :new
      expect(response).to render_template(:new)
    end
  end

end
