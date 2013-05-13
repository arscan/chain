require 'spec_helper'

feature "view my activies" do
    background do
        sign_in
    end

    scenario "cannot see another user's activities" do
        user = create(:user)
        activity = create(:activity, user: user, name: "a different users activity")
        visit root_url

        expect(page).not_to have_text("a different users activity")

    end

end


feature "create new activity" do

    background do
        @user = sign_in
    end


    scenario "with no name throws an error" do
        visit root_url
        click_link "New Activity"
        fill_in "Name", with: ""

        click_button "Create"

        expect(page).to have_text("error")

    end

    scenario "with a duplicate name throws an error" do
        activity = create(:activity, name: "A stupid name", user: @user)
        visit root_url
        click_link "New Activity"
        fill_in "Name", with: "A stupid name"

        click_button "Create"

        expect(page).to have_text("error")

    end

    scenario "with a duplicate name from another user is ok" do
        activity = create(:activity, name: "A stupid name")
        visit root_url
        click_link "New Activity"
        fill_in "Name", with: "A stupid name"

        click_button "Create"

        expect(page).not_to have_text("error")

    end
end

feature "delete activity" do
    background do
        sign_in
    end

end

feature "edit activity" do

    background do
        sign_in
    end
end

feature "check off activity" do

    background do
        @user = sign_in
    end

end

