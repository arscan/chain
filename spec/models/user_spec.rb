require 'spec_helper'

describe User do

    describe "email" do 

        it "cannot be duplicate" do

            user = create(:user, email: "blah@blah.com")
            user2 = create(:user)
            user2.email = "blah@blah.com"

            user2.should_not be_valid

        end

    end
    
end
