require 'spec_helper' 

describe Activity do

    describe "validations" do

        it "cannot be blank" do

            activity = create(:activity)
            activity.name = ""

            activity.should_not be_valid

        end

        it "cannot be duplicate" do

            activity = create(:activity, name: "blah")
            activity2 = create(:activity)
            activity2.name = "blah"

            activity2.should_not be_valid

        end
    end
end




