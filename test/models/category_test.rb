require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Example Project", week: 1)
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = "     "
    assert_not @category.valid?
  end

  test "week should be present" do
    @category.week = "     "
    assert_not @category.valid?
  end

  test "week should be 1 - 52" do
    @category.week > 0 && @category.week < 53
    assert_not @category.valid?
  end

  test "weeks should be unique" do
    duplicate_week = @category.dup
    @category.save
    assert_not duplicate_week.valid?
  end
end