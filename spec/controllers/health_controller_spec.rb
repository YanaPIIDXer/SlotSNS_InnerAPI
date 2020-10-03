require 'rails_helper'

RSpec.describe HealthController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['condition']).to eq('ok')
    end
  end
end
