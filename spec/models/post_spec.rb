require 'rails_helper'

RSpec.describe Post, type: :model do
    it 'Create' do
        post = Post.new(title: "Title", body: "body")
        result = post.valid? && post.save!
        expect(result).to be_truthy
    end

    it 'Zero length string is invalid' do
        post = Post.new(title: "", body: "")
        result = post.valid?
        expect(result).to be_falsy
    end
    
    it 'null is invalid' do
        post = Post.new(title: nil, body: nil)
        result = post.valid?
        expect(result).to be_falsy
    end
end
