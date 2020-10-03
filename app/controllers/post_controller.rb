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

    id = params[:id]
    post = Post.find_by(id: id)
    if post == nil
      render json: response
      return
    end

    title = params[:title]
    body = params[:body]
    post.title = title
    post.body = body
    response['result'] = (post.valid? && post.save!)
    
    render json: response
  end

  def delete
    response = {'result' => false}
    id = params[:id]

    post = Post.find_by(id: id)
    if post == nil
      render json: response
      return
    end

    response['result'] = post.destroy
    render json: response
  end
end
