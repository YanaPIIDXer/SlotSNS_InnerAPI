class RegisterController < ApplicationController
    def index
        response = { 'result' => false }
        render json: response
    end
end
