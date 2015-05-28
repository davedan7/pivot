require "rails_helper"

RSpec.describe "User view" do
  context "with valid attributes" do
    it "can logout a user" do
      visit new_user_path
      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Location", with: "Denver"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Update User"

      visit root_path
      click_link_or_button "Logout"
      expect(page).to have_content("Successfully logged out")
    end

    it "can login a user" do
      visit new_user_path

      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Location", with: "Denver"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Update User"

      visit root_path
      click_link_or_button "Logout"
      expect(page).to have_content("Successfully logged out")
      click_link_or_button "Log In"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      click_link_or_button "Login"
      expect(page).to have_content("Dashboard")
    end

  end

end
