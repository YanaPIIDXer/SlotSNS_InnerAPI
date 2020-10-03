require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      params = { email: "example@example.com", password: "Password" }
      get :index, params: params
      expect(response).to have_http_status(:success)
    end

    it "Is login" do
      email = "example@example.com"
      password = "Password"
      User.create(name: "Name", password: password, email: email)

      params = { email: email, password: password }
      post :create, params: params

      get :index, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Is not login" do      
      get :index, params: { email: "example@example.com", password: "Password" }
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end

  describe "POST #create" do
    it "returns http success" do
      params = { email: "example@example.com", password: "Password" }
      post :create, params: params
      expect(response).to have_http_status(:success)
    end

    it "Login" do
      email = "example@example.com"
      password = "Password"
      User.create(name: "Name", password: password, email: email)

      params = { email: email, password: password }
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Invalid user" do
      params = { email: "example@example.com", password: "Password" }
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end

  describe "POST #delete" do
    it "returns http success" do
      params = { email: "example@example.com", password: "Password" }
      post :delete, params: params
      expect(response).to have_http_status(:success)
    end

    it "Logout" do
      email = "example@example.com"
      password = "Password"
      User.create(name: "Name", password: password, email: email)

      params = { email: email, password: password }
      post :create, params: params

      post :delete, params: { email: email }
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Check logout successful" do
      email = "example@example.com"
      password = "Password"
      User.create(name: "Name", password: password, email: email)

      params = { email: email, password: password }
      post :create, params: params

      post :delete, params: { email: email }

      get :index, params: { email: email }
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Not login" do
      email = "example@example.com"
      password = "Password"
      User.create(name: "Name", password: password, email: email)

      post :delete, params: { email: email }
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end

    it "Invalid user" do
      post :delete, params: { email: "example@example.com" }
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end
end
