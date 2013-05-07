require 'spec_helper'

describe Check do
    
    describe "validations" do

        it "cannot have an empty date" do

            activity = create(:activity_with_check)
            puts activity.checks.inspect
            activity.checks[0].datetime = nil

            activity.checks[0].should_not be_valid

        end
    end
end
