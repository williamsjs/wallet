require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "get acount total" do
   assert_equal 19.98 , Activity.total
 end

 test "get transaction count" do
   assert_equal 2, Activity.transactions
 end

end
