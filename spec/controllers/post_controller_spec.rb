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

    it "create new post" do
      title = "Test"
      params = {title: title, body: "Test"}
      post :create, params: params

      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy

      created = Post.find_by(title: title)
      expect(created).to be_truhty    # created != nil
    end

    it "Empty text is invalid" do
      params = {title: "", body: ""}
      post :create, params: params
      
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
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
