require 'test_helper'

class InhabitantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get married"  do
    inhabitant = Inhabitant.new
    assert inhabitant.id != nil
  end
end
