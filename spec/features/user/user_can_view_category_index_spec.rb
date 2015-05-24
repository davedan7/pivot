require 'rails_helper'

RSpec.describe "user can view category index" do
  it "user sees category index" do
    default_user = create(:applicant_user)
    job = create(:job)
    job1 = job.create(title: "wings", description: "good food", price: 11)
    category = create(:category)
    category.jobs << [job, job1]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit categories_path

    expect(page).to have_content("main course")

    within(".category_name") do
      click_link_or_button "main course"
    end

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.description)
  end
end
