require "rails_helper"

RSpec.describe "admin can delete categories" do
  it "can delete a category" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    visit admin_category_path(category)
    click_link_or_button "Delete Category"

    expect(current_path).to eq(admin_categories_path)
    expect(page).not_to have_content("for main course jobs")
  end

  it "can delete a categories" do
    admin = create(:super_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category1 = create(:category1)
    category2 = create(:category2)
    category3 = create(:category3)
    visit admin_category_path(category3)
    expect(page).to have_content("C##")
    expect(page).to have_content("Javascript")
    expect(page).to have_content("Administration")
    first(:button, "Delete Category").click

    expect(page).not_to have_content("C##")
    expect(page).to have_content("Javascript")
    expect(page).to have_content("Administration")
  end

end
