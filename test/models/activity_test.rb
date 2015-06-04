require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "get acount balance" do
   assert_equal 19.98 , Activity.balance
 end

 test "get transaction count" do
   assert_equal 4, Activity.transactions
 end

 test "get transactions this month" do
   assert_equal 4, Activity.transactions_month
 end

 test "get transactions last month" do
   assert_equal 0, Activity.transactions_previous_month
 end

 test "get most expensive" do
   assert_equal 10.00, Activity.most_expensive.to_f
 end

 test "get total for month" do
   assert_equal 10, Activity.total_month
 end

 test "get total for previous month" do
   assert_equal 0, Activity.total_previous_month
 end

 test "get most expensive for current month" do
   assert_equal 10.00, Activity.most_expensive_for_month.to_f
 end

end
