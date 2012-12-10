require 'test_helper'

class WeddingTest < ActiveSupport::TestCase

  test "new wedding" do
  	person1 = Inhabitant.new first_name: "Person_1", last_name: "LastName_1", gender: "Male", age: 19
  	person2 = Inhabitant.new first_name: "Person_2", last_name: "LastName_2", gender: "Female", age: 19
  	wedding = Wedding.new first_spouse_id: person1.id, second_spouse_id: person2.id
    #assert wedding.valid?, "Invalid wedding"
  end
end
