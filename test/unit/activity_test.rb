require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
    fixtures :activities
    test "activity name cannot be blank" do
        activity = Activity.new
        assert activity.invalid?
        assert activity.errors[:name].any?
    end
    
    test "activity cannot be a duplicate" do
        activity = Activity.new(name: activities(:floss).name)
        assert activity.invalid?
        assert_equal ["has already been taken"], activity.errors[:name]
    end
    
end
