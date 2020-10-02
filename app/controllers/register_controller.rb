class RegisterController < ApplicationController
    def index
        response = { "message" => "fuck" }
        render :json => response
    end
end
