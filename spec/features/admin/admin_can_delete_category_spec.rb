require "rails_helper"

RSpec.describe "admin can delete categories" do
  it "can delete a category" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    visit admin_category_path(category)
    click_link_or_button "Delete Category"

    expect(current_path).to eq(admin_categories_path)
    expect(page).not_to have_content("main course")
  end

  it "can delete a categories" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    category = create(:category1)
    category = create(:category2)
    visit admin_category_path(category)
    expect(page).to have_content("main course")
    expect(page).to have_content("drinks")
    expect(page).to have_content("curries")
    first(:button, "Delete Category").click

    expect(page).not_to have_content("curries")
    expect(page).to have_content("drinks")
    expect(page).to have_content("main course")
  end

end
