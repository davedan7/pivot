require "rails_helper"

RSpec.describe "user job list" do
  context "when a non admin visits site" do
    it "can not see retired jobs" do
      5.times do |x|
        create(:job, title: "job#{x}")
      end

      create(:job, title: "Retired job", status: "retired")

      visit jobs_path

      expect(page).to have_content("job0")
      expect(page).to have_content("job1")
      expect(page).to have_content("job2")
      expect(page).to have_content("job3")
      expect(page).to have_content("job4")
      expect(page).not_to have_content("Retired job")
    end
  end
end
