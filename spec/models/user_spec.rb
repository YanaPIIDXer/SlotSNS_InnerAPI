require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Register' do
    name = 'Name'
    password = 'Password'
    email = 'example@example.com'
    user = User.new(name: name, password: password, email: email)
    result = user.save!
    expect(result).to be_truthy
  end

  it 'zero length string is invalid' do
    user = User.new(name: '', password: '', email: '')
    expect(user.valid?).to be_falsy
  end

  it 'null is invalid' do
    user = User.new(name: nil, password: nil, email: nil)
    expect(user.valid?).to be_falsy
  end

  it 'email is unique' do
    email = 'example@example.com'
    User.create(name: 'Name', password: 'Password', email: email)
    user = User.new(name: 'Name', password: 'Password', email: email)
    expect(user.valid?).to be_falsy
  end
end
