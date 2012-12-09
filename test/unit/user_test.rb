require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "new invalid user"  do
    user = User.new
    assert !user.valid?
  end

  test "new invalid user username only" do
  	user = User.new :username => "Dooley"
  	assert !user.valid?
  end

  test "new invalid user with username email only" do
  	user = User.new :username => "Dooley", :email => "frr@free.fr"
  	assert !user.valid?
  end

  test "new valid user" do
  	user = User.new username: "Dooley", email: "frr@free.fr", password: "password" 
  	assert user.valid?
  end

  test "new valid admin user" do
  	user = User.new username: "Dooley", email: "frr@free.fr", password: "password", admin: true
  	assert user.valid?
  end
end
