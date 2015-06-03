require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "get acount total" do
   assert_equal 29.98 , Activity.total
 end

 test "get transaction count" do
   assert_equal 3, Activity.transactions
 end

 test "get largest amount" do
   assert_equal 9.99, Activity.most_expensive
 end

end
