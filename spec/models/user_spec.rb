# require 'rails_helper'
#
#   describe User do
#     it {should validate_presence_of(:password)}
#     it {should validate_presence_of(:email)}
#     it {should validate_presence_of(:location)}
#     it {should validate_presence_of(:username)}
#     it {should validate_length_of(:name).is_at_least(2).is_at_most(32)}
#     it {should validate_uniqueness_of(:username)}
#     it {should validate_uniqueness_of(:email)}
#     it {should validate_uniqueness_of(:slug)}
#   end
#
# RSpec.describe "invalid email" do
#   it "should not create a user" do
#     user = User.create(
#       name: "Mihir McDog", username: "mihir1",
#       email: "mihir787gmail.com", password: "cos",
#       password_confirmation: "cos"
#       )
#     expect(user).not_to be_valid
#   end
#
# end
