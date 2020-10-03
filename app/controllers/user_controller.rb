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
    name = params[:name]
    password = params[:password]
    email = params[:email]

    user = User.new(name: name, password: password, email: email)
    result = user.valid? && user.save!
    response = { 'result' => result }
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
