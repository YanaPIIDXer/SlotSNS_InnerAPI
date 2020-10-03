require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      params = { email: "example@example.com", password: "Password" }
      get :index, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      params = { email: "example@example.com", password: "Password" }
      post :create, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #delete" do
    it "returns http success" do
      params = { email: "example@example.com", password: "Password" }
      post :delete, params: params
      expect(response).to have_http_status(:success)
    end
  end

end
