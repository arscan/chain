require 'spec_helper'

feature "log in" do

    scenario "with an invalid user results in an error" do
        visit root_url
        click_link "Log"
        fill_in "Email", with: "robscanlon@gmail.com"
        fill_in "Password", with: "hello"

        click_button "Log"

        expect(page).to have_text("invalid")

    end

    scenario "with a valid user and log out after" do
        user = create(:user, email: "other@example.com", password: "rous")
        visit root_url
        click_link "Log"
        fill_in "Email", with: "other@example.com"
        fill_in "Password", with: "rous"

        click_button "Log"

        expect(page).to have_text("Welcome")
        expect(page).to have_text("Log Out")

        click_link "Log Out"
        expect(page).to have_text("Log In")

    end
end

feature "register" do

    scenario "with valid information" do
        visit signup_path

        fill_in "Email", with: "robscanlon@gmail.com"
        fill_in "Password", with: "hiyaaa"
        fill_in "Password confirmation", with: "hiyaaa"

        click_button "Sign Up"

        expect(page).to have_text "Thank you for signing up"
        expect(page).to have_text "Welcome robscanlon@gmail.com"

    end

    scenario "with mismatched passwords" do
        visit signup_path

        fill_in "Email", with: "robscanlon@gmail.com"
        fill_in "Password", with: "hiyaaa"
        fill_in "Password confirmation", with: "hiaaa"

        click_button "Sign Up"

        expect(page).to have_text "invalid"

    end

    scenario "with an empty email" do

        visit signup_path

        fill_in "Email", with: ""
        fill_in "Password", with: "hiyaaa"
        fill_in "Password confirmation", with: "hiaaa"

        click_button "Sign Up"

        expect(page).to have_text "invalid"
    end

    scenario "with a bad password" do
        visit signup_path

        fill_in "Email", with: "robscanlon@gmail.com"
        fill_in "Password", with: ""
        fill_in "Password confirmation", with: ""

        click_button "Sign Up"

        expect(page).to have_text "invalid"

    end

    scenario "with an email that is already registered" do

        user = create(:user, :email => "robscanlon@gmail.com", :password => "hiya")

        visit signup_path

        fill_in "Email", with: "robscanlon@gmail.com"
        fill_in "Password", with: "hi"
        fill_in "Password confirmation", with: "hi"

        click_button "Sign Up"

        expect(page).to have_text "invalid"
    end

end

