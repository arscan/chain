require 'spec_helper'

feature "create new activity" do

    background do
        sign_in
    end


    scenario "with no name throws an error" do
        visit root_url
        click_link "New Activity"
        fill_in "Name", with: ""

        click_button "Create"

        expect(page).to have_text("error")

    end

    scenario "with no name throws an error" do
        activity = create(:activity, name: "A stupid name")
        visit root_url
        click_link "New Activity"
        fill_in "Name", with: "A stupid name"

        click_button "Create"

        expect(page).to have_text("error")

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
        sign_in
    end

    scenario "to see if it works" do
        activity = create(:activity)

        visit root_url

        click_link "Check"

        expect(page).to have_text("UTC")

    end

end

