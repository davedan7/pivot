require "rails_helper"

RSpec.describe "applying for a job" do

  it "adds job to basket" do
    user = User.create(name: "Test Business", email: "test@example.com", username: "test_business", password: "password", role: 1, location: "Denver", description: "Blah blah blah blah", pending: false, business_status: true) 
    # business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: user.id)
    # user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit business_jobs_path(user)
    expect(current_path).to eq(business_jobs_path)
    # expect(page).to have_content("engineer")
    click_link_or_button "engineer"
    click_link_or_button "Add Job to Basket"
    expect(page).to have_content("You have added the job, engineer, to your basket.")
  end

  xit "gives error message when checking out if basket empty" do
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit checkout_path
    click_link_or_button "Submit"

    expect(page).to have_content("Your basket can't be empty!")
  end

  xit "can remove job" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: business.id)
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit business_jobs_path(business)
    expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "engineer"
    click_link_or_button "Add Job to Basket"
    expect(page).to have_content("You have added the job, engineer, to your basket.")

    visit checkout_path

    click_link_or_button "Remove"

    expect(page).to_not have_content("engineer")
  end

  xit "cannot add retired job to basked" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: business.id, status: false)
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit business_jobs_path(business)
    expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "engineer"
    click_link_or_button "Add Job to Basket"
    expect(page).to have_content("Retired job cannot be added to cart")
  end
end
