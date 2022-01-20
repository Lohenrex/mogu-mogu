require "test_helper"

class UserTest < ActiveSupport::TestCase
  def resource
    @resource ||= build(:user)
  end

  test "is a valid resource" do
    assert resource.valid?
  end
end
