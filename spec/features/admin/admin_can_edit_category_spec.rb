require "rails_helper"

RSpec.describe "admin can update categories" do
  it "can update a category" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    visit admin_categories_path

    within(".admin_categories_index") do
    click_link_or_button "main course"
  end

    click_button "Edit Category"
    fill_in "Name", with: "Appetizer"
    fill_in "Description", with: "before main course"
    click_button "Update Category"

    expect(page).to have_content("Appetizer")
  end

  it "cannot update a category to have a blank field" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    visit admin_categories_path

    within(".admin_categories_index") do
      click_link_or_button "main course"
    end

    click_button "Edit Category"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Update Category"
    expect(page).to have_content("Name can't be blank, Description can't be blank")
  end

  it "cannot update a category to have a category name of another category" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    category1 = create(:category1)
    visit admin_categories_path

    within(".admin_categories_index") do
      click_link_or_button "main course"
    end

    click_button "Edit Category"
    fill_in "Name", with: "drinks"
    fill_in "Description", with: "different kinds"
    click_button "Update Category"
    expect(page).to have_content("Name has already been taken, Description has already been taken")
  end
end
