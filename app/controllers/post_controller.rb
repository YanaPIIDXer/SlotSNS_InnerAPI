class PostController < ApplicationController
  def index
    response = {'result' => false}
    render json: response
  end

  def create
    response = {'result' => false}
    title = params[:title]
    body = params[:body]

    post = Post.new(title: title, body: body)
    response['result'] = (post.valid? && post.save!)

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
