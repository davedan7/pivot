require "rails_helper"

RSpec.describe "Business user status" do
  context "When creating an account" do
    it "is initially set with an offline status so it can be verified by ADMIN" do

      business = User.new(name: "Banana Stand LLC",
                          username: "Banana's and More",
                          email: "yellow@banana.com",
                          location: "Denver, Co",
                          password: "password")
      visit root_path

      click_link "Create a Business Account"

      expect(current_path).to eq(new_business_path)
      fill_in "Name", with: business.name
      fill_in "Username", with: business.username
      fill_in "Email", with: business.email
      fill_in "user[description]", with: "We sell Bananas and Banana themed things!"
      fill_in "Location", with: business.location
      fill_in "Password", with: business.password
      fill_in "Password confirmation", with: business.password
      click_button "Submit"

      expect(current_path).to eq(confirm_business_application_path)

      expect(page).to have_content("Thanks for applying to post your jobs!")
      expect(page).to have_content("You should receive an email from us shortly")
      expect(page).to have_content("Business Status with Jo.bs: Offline")

      click_link "OK"

      expect(current_path).to eq(root_path)
    end
  end
end
