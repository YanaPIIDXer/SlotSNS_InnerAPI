require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Register' do
    name = 'Name'
    password = 'Password'
    email = 'example@example.com'
    user = User.new(name: name, password: password, email: email)
    result = user.valid? && user.save!
    expect(result).to be_truthy
  end

  it 'Zero length string is invalid' do
    user = User.new(name: '', password: '', email: '')
    expect(user.valid?).to be_falsy
  end

  it 'Null is invalid' do
    user = User.new(name: nil, password: nil, email: nil)
    expect(user.valid?).to be_falsy
  end

  it 'Email is unique' do
    email = 'example@example.com'
    User.create(name: 'Name', password: 'Password', email: email)
    user = User.new(name: 'Name', password: 'Password', email: email)
    expect(user.valid?).to be_falsy
  end

  it 'Encrypt password' do
    plain_password = 'Password'
    user = User.new(name: 'Name', password: plain_password, email: 'example@example.com')
    expect(user.password_digest).not_to eq(plain_password)
  end

  it 'Email validation' do
    success_user = User.new(name: 'Name', password: 'Password', email: 'example@example.com')
    expect(success_user.valid?).to be_truthy

    fail_user = User.new(name: 'Name', password: 'Password', email: 'example')
    expect(fail_user.valid?).to be_falsy
    fail_user = User.new(name: 'Name', password: 'Password', email: 'example@')
    expect(fail_user.valid?).to be_falsy
    fail_user = User.new(name: 'Name', password: 'Password', email: 'example@example.com@example.com')
    expect(fail_user.valid?).to be_falsy
  end
end
