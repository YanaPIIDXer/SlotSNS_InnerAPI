require 'rails_helper'

RSpec.describe RegisterController, type: :controller do
    describe 'Register API' do
        it 'StatusCode check' do
            params = { name: 'Name', password: 'Password', email: 'example@example.com' }
            post 'index', params: params
            expect(response.status).to eq(200)
        end

        it 'Register new user' do
            params = { name: 'Name', password: 'Password', email: 'example@example.com' }
            post 'index', params: params
            json = JSON.parse(response.body)
            expect(json['result']).to be_truthy
        end
        
        it 'Zero length string is invalid' do
            params = { name: '', password: '', email: '' }
            post 'index', params: params
            json = JSON.parse(response.body)
            expect(json['result']).to be_falsy
        end
        
        it 'EMail is unique' do
            email = 'example@example.com'    
            User.create(name: 'Name', password: 'Password', email: email)
            params = { name: 'Name', password: 'Password', email: email }
            post 'index', params: params
            json = JSON.parse(response.body)
            expect(json['result']).to be_falsy
        end
    end
end
