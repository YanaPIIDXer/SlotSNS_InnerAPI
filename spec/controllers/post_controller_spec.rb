require 'rails_helper'

RSpec.describe PostController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update" do
    it "returns http success" do
      post :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #delete" do
    it "returns http success" do
      post :delete
      expect(response).to have_http_status(:success)
    end
  end
end
