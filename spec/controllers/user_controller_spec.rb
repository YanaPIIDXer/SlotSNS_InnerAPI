require 'rails_helper'

RSpec.describe UserController, type: :controller do
  EMAIL = "example@example.com"
  PASSWORD = "Password"
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "User List" do
      for i in 1..5 do
        User.create(name: "User#{i}", email: "example#{i}@example.com", password: "Password")
      end

      get :index
      json = JSON.parse(response.body)
      list = json['list']
      i = 1
      for user in list do
        expect(user['name']).to eq("User#{i}")
        expect(user['email']).to eq("example#{i}@example.com")
        i = i + 1
      end
    end
  end

  describe "POST #create" do
    it "returns http success" do
      params = { email: EMAIL, password: PASSWORD }
      post :create, params: params
      expect(response).to have_http_status(:success)
    end

    it "Create User" do
      params = { email: EMAIL, password: PASSWORD }
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy
    end

    it "Duplicate email" do
      User.create(name: "Name", email: EMAIL, password: PASSWORD)
      params = { email: EMAIL, password: PASSWORD }
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end

    it "Validation error" do
      params = { email: "example", password: PASSWORD }
      post :create, params:params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy

      params[:email] = ""
      post :create, params:params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy

      params[:email] = "example@example.com@example.com"
      post :create, params:params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
      
      params[:email] = { email: EMAIL, password: "" }
      post :create, params:params
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end

  describe "GET #update" do
    it "returns http success" do
      post :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    it "returns http success" do
      post :delete
      expect(response).to have_http_status(:success)
    end
  end
end
