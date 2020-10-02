require 'rails_helper'

RSpec.describe RegisterController, type: :controller do
    describe 'Register API' do
        # ステータスコードが正常か？
        it "StatusCode 200" do
            get 'index'
            expect(response.status).to eq(200)
        end
    end
end
