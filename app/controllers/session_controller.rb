class SessionController < ApplicationController
  def index
    result = (session[:email] != nil)
    render json: { 'result' => result }
  end

  def create
    response = { 'result' => false }
    if session[:email] != nil
      response['result'] = true
      render json: response
      return
    end

    user = User.find_by(email: params[:email])
    if user != nil && user.authenticate(params[:password])
      response['result'] = true
      session[:email] = user.email
    end

    render json: response
  end

  def delete
    response = { 'result' => false }
    if session[:email] == nil
      response['result'] = false
      render json: response
      return
    end
    
    render json: response
  end
end
