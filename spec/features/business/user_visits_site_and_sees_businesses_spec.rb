require 'rails_helper'

RSpec.feature 'user authentication' do

  context 'a registered user' do
      let(:bob)  { User.create(name: 'Bob', username: 'Bob', email: 'bob@bob.bob', location: 'Denver', role: 0, password: 'password')}
      let(:business) { User.create(name: 'Turing School',
                                   username: 'turing',
                                   email: 'turing@turing.io',
                                   location: 'Denver',
                                   role: 1,
                                   password: 'password')}

    it 'shows the businesses' do
      User.create(name: 'Turing School',
       username: 'turing',
       email: 'turing@turing.io',
       location: 'Denver',
       role: 1,
       password: 'password')

      # bob = User.create(name: 'Bob', username: 'Bob', email: 'bob@bob.bob', location: 'Denver', role: 0, password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
      visit businesses_path

      # save_and_open_page
      expect(page).to have_content("Turing School")
    end
  end
end