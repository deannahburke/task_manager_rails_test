require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup 
    @task = Task.new(title: "Gardening", description: "Pull all weeds")
  end 

  test "valid task" do
    assert @task.valid? 
   end

   test "invalid without title" do 
    @task.title = nil
    refute @task.valid?, "saved task without a title"
    assert_not_nil @task.errors[:title], "no validation error for title present"
   end 

   test "invalid without description" do
    @task.description = nil 
    refute @task.valid? 
    assert_not_nil @task.errors[:description]
   end
end

