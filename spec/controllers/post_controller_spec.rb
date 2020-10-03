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

      is_created = (Post.find_by(title: title) != nil)
      expect(is_created).to be_truthy
    end

    it "Empty text is invalid" do
      params = {title: "", body: ""}
      post :create, params: params
      
      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end

    it "Nil text is invalid" do
      params = {title: nil, body: nil}
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

    it "update post" do
      target = FactoryBot.create(:post)
      title = "Updated"
      body = "Updated"
      
      params = {id: target.id, title: title, body: body}
      post :update, params: params

      json = JSON.parse(response.body)
      expect(json['result']).to be_truthy

      updated = Post.find(target.id)
      expect(updated.title == title).to be_truthy
      expect(updated.body == body).to be_truthy
    end

    it "Invalid post ID" do
      params = {id: 1, title: "title", body: "body"}
      post :update, params: params

      json = JSON.parse(response.body)
      expect(json['result']).to be_falsy
    end
  end

  describe "POST #delete" do
    it "returns http success" do
      post :delete
      expect(response).to have_http_status(:success)
    end
  end
end
