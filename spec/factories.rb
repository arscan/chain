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

        factory :user_with_activity do
            after(:create) do |user|
                create(:activity_with_check)
            end
        end
    end

end

