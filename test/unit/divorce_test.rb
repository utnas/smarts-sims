require 'test_helper'

class DivorceTest < ActiveSupport::TestCase

  test "new Devorce" do
  	divorce = Divorce.new first_person_id: 1, second_person_id: 2
    # assert divorce.valid?
  end
end
