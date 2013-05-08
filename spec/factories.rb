FactoryGirl.define do

    factory :activity do

        sequence(:name) {|n| "activity number #{n}"}

        factory :activity_with_check do
            after(:create) do |activity|
                create(:check, activity: activity)
            end
        end
    end

    factory :check do
        datetime Time.now
    end

    factory :user do
        sequence(:email) {|n| "blah#{n}@blah.com"}
        password "blahhh"
    end

end

