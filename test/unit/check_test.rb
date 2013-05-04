require 'test_helper'

class CheckTest < ActiveSupport::TestCase

    test "should be able to create a check" do
        activity = Activity.new(name: "check test")
        activity.save
        check = activity.checks.create(datetime: Time.now)
        assert check.valid?
    end

    test "datetime cannot be blank" do
        activity = Activity.new(name: "check test2")
        activity.save
        check = activity.checks.create
        assert check.invalid?
        assert check.errors[:datetime].any?
    end
    
end
