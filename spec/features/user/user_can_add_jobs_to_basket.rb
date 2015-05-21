require 'rails_helper'

RSpec.describe("user applying to a job") do
  context "when unauthorized"
    it "a can add a job to a basket" do
      business = User.create(name: "Turing School", username: "Turing", email: "turing@turing.io", location: "Denver", role: 1, password: "password" )
      job1 = Job.create!(title: "Engineer", description: "Lots of experience salary 20k", posting_cost: 20, user_id: business.id)
      job2 = Job.create!(title: "Developer", description: "Some expierience javascript 200k", posting_cost: 20, user_id: business.id)

      visit businesses_path

      click_link("Turing")

      expect(current_path).to eq("/turing/jobs")
      expect(page).to have_content("Engineer")
      expect(page).to have_content("Developer")
      expect(page).to have_content("Some expierience javascript 200k")
      expect(page).to have_css("h2")

      first(:button, "Add Job").click

      visit checkout_path

      expect(current_path).to eq(checkout_path)

      save_and_open_page








    end

end
