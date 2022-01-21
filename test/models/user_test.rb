# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def resource
    @resource ||= build(:user)
  end

  test "is a valid resource" do
    assert resource.valid?
  end

  test "guest is default role" do
    assert resource.guest?
  end
end
