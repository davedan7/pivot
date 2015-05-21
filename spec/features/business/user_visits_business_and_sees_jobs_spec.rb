require 'rails_helper'

RSpec.describe 'user authentication' do
  context 'a guest user' do
    let!(:business) {User.create(name: 'Turing School',
                                 username: 'turing',
                                 email: 'turing@turing.io',
                                 location: 'Denver',
                                 role: 1,
                                 password: 'password')}

    it 'shows the businesses jobs' do
      job1 = Job.create(title: "JS Engineer", description: "wrangle semicolons for cash", posting_cost: 10, user_id: business.id)
      job2 = Job.create(title: "Ruby Programmer", description: "MINASWAN", posting_cost: 10, user_id: business.id)

      visit "turing/jobs"
      expect(page).to have_content("JS Engineer")
      expect(page).to have_content("MINASWAN")
    end
  end
end
