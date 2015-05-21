require 'rails_helper'

 RSpec.describe "Visiting cart page" do
   it "displays appropriate content" do
     visit checkout_path
     expect(page).to have_content("Company")
     expect(page).to have_content("Position")
   end
 end
