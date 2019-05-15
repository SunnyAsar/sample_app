require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @user = users(:sunny)
    @micropost = @user.microposts.build(content: "hello world")
  end

  test "shold be valid" do 
    assert @micropost.valid?
  end

  test "user id shoulf not be blank" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end


  test "content should be present" do 
    @micropost.content  = " "
    assert_not @micropost.valid?
  end

  test "content should be less or equl to 140 char" do
    @micropost.content = "hello world" * 30
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
