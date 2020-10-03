class UserController < ApplicationController
  def index
    list = []
    
    users = User.all
    for user in users do
      list.push({:name => user.name, :email => user.email})
    end

    response = { 'list' => list }
    render json: response
  end

  def create
    response = { 'result' => false }
    render json: response
  end

  def update
    response = { 'result' => false }
    render json: response
  end

  def delete
    response = { 'result' => false }
    render json: response
  end
end
