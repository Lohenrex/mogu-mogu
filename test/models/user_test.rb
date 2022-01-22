# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def resource
    @resource ||= build(:user)
  end

  test "is a valid resource" do
    assert resource.valid?
  end

  test "free is default role" do
    assert resource.free?
  end
end
