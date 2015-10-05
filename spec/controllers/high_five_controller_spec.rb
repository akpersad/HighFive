require 'rails_helper'

RSpec.describe HighFiveController, type: :controller do

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #view" do
    it "returns http success" do
      get :view
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #favorite" do
    it "returns http success" do
      get :favorite
      expect(response).to have_http_status(:success)
    end
  end

end
