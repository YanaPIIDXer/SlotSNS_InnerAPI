require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      params = { email: @user.email, password: @user.password }
      get :index
      expect(response).to have_http_status(:success)
    end

    it "Is login" do
      params = { email: @user.email, password: @user.password }
      post :create, params: params

      get :index
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Is not login" do
      get :index
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end

  describe "POST #create" do
    it "returns http success" do
      params = { email: @user.email, password: @user.password }
      post :create, params: params
      expect(response).to have_http_status(:success)
    end

    it "Login" do
      params = { email: @user.email, password: @user.password }
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Invalid user" do
      params = { email: "invalid@example.com", password: "InvalidPassword" }
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end

  describe "POST #delete" do
    it "returns http success" do
      post :delete
      expect(response).to have_http_status(:success)
    end

    it "Logout" do
      params = { email: @user.email, password: @user.password }
      post :create, params: params

      post :delete
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Check logout successful" do
      params = { email: @user.email, password: @user.password }
      post :create, params: params

      post :delete

      get :index
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end

    it "Not login" do
      post :delete
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end
end
