require "rails_helper"

RSpec.describe "admin categories" do
  context "with admin logged in" do
    it "can create a new category" do
      admin = create(:super_user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin)

      visit admin_categories_path
      click_button "Create Category"

      expect(current_path).to eq(new_admin_category_path)

      fill_in "Name", with: "Java"
      fill_in "Description", with: "hard"
      click_button "Create Category"
      expect(page).to have_content("Java")
    end

    it "can create new categories" do
      admin = create(:super_user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin)

      visit admin_categories_path
      click_button "Create Category"
      fill_in "Name", with: "Admin"
      fill_in "Description", with: "hard"
      click_button "Create Category"

      visit admin_categories_path
      click_button "Create Category"
      fill_in "Name", with: "C##}"
      fill_in "Description", with: "basic"
      click_button "Create Category"
      expect(page).to have_content("C##")
      expect(page).to have_content("basic")
    end
  end

  context "with admin logged in" do
    it "cannot create a category that has already been created" do
      admin = create(:super_user)
      category = create(:category)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin)

      visit admin_categories_path
      click_button "Create Category"
      fill_in "Name", with: "Ruby"
      fill_in "Description", with: "for main course jobs"
      click_button "Create Category"
      expect(page).to have_content("Name has already been taken, Description has already been taken")
    end
  end

  context "with admin logged in" do
    it "cannot create a category that is blank" do
      admin = create(:super_user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin)

      visit admin_categories_path
      click_button "Create Category"
      fill_in "Name", with: ""
      fill_in "Description", with: ""
      click_button "Create Category"
      expect(page).to have_content("Name can't be blank, Description can't be blank")
    end
  end
end
