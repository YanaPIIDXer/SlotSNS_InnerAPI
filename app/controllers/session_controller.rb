class SessionController < ApplicationController
  def index
    result = (session[:id] != nil)
    render json: { 'result' => result }
  end

  def create
    response = { 'result' => false }
    if session[:id] != nil
      response['result'] = true
      render json: response
      return
    end

    render json: response
  end

  def delete
    response = { 'result' => false }
    if session[:id] == nil
      response['result'] = true
      render json: response
      return
    end

    render json: response
  end
end
