class RegisterController < ApplicationController
    def index
        name = params[:name]
        password = params[:password]
        email = params[:email]

        user = User.new(name: name, password: password, email: email)
        result = user.valid?
        if result
            result = user.save!
        end
        
        response = { 'result' => result }
        render json: response
    end
end
