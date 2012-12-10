require 'test_helper'

class InhabitantTest < ActiveSupport::TestCase
  
  test "new valid inhabitant" do
    person1 = Inhabitant.new first_name: "Person_1", last_name: "Name_1", gender: "Male", age: 19
    assert person1.valid?
  end

  test "inhabitant first and seconde name " do
    person1 = Inhabitant.new id: 1, first_name: "Person_1", last_name: "Name_1", gender: "Male", age: 19
    assert person1.first_name == "Person_1", "first_name equals to Person_1"
    assert person1.last_name == "Name_1", "last_name es to Name_1"
    assert person1.age == 19, "age equals 19"
  end

  test "new invalid inhabitant" do
  	inhabitant = Inhabitant.new first_name: "Dooley", last_name: "Nsewolo", gender: "Male"
    assert !inhabitant.valid?
  end
end
