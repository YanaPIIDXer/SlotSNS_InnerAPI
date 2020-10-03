class PostController < ApplicationController
  def index
    response = {'result' => false}
    render json: response
  end

  def create
    response = {'result' => false}
    render json: response
  end

  def update
    response = {'result' => false}
    render json: response
  end

  def delete
    response = {'result' => false}
    render json: response
  end
end
