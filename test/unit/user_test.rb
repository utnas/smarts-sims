require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "new invalid user"  do
    user = User.new
    assert !user.valid?, "invalid empty fields user"
  end

  test "new invalid user username only" do
  	user = User.new :username => "Dooley"
  	assert !user.valid?, "invalid user with username"
  end

  test "new invalid user with username email only" do
  	user = User.new :username => "Dooley", :email => "frr@free.fr"
  	assert !user.valid?, "invalid user with email"
  end

  test "new valid admin user" do
  	user = User.new username: "Dooley", email: "frr@free.fr", password: "password", admin: true
  	assert user.valid?, "valid admin user"
  end

  test "new valid user" do
  	user = User.new username: "Dooley", email: "frr@free.fr", password: "password" 
  	assert user.username == "Dooley", "username equals to Dooley"
  	assert user.email == "frr@free.fr", "username email equals to frr@free.fr"
  	assert user.password == "password", "password equals to password"
  	assert user.valid?, "a valid user creation"
  end
end
