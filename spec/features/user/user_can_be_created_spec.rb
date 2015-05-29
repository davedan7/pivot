require "rails_helper"

RSpec.describe "User view" do
  context "with valid attributes" do
    it "can create a new user" do
      visit new_user_path
      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Location", with: "Denver"
      fill_in "user[password]", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Submit User Information"

      expect(page).to have_content("davy")
    end


    it "cannot be created without name" do
      visit new_user_path

      fill_in "Name", with: ""
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Location", with: "Denver"
      fill_in "user[password]", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Submit User Information"

      expect(page).to have_content("Sign Up Name is too short")
    end

    it "can not Create my account with a taken username" do

      visit new_user_path

      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Location", with: "Denver"
      fill_in "user[password]", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Submit User Information"

      visit new_user_path

      fill_in "Name", with: "David James"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "davidjames@gmail.com"
      fill_in "Location", with: "Denver"
      fill_in "user[password]", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Submit User Information"

      expect(page).to have_content("Username has already been taken")
    end
  end
end
