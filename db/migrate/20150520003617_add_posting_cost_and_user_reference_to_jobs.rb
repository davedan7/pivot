class AddPostingCostAndUserReferenceToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :posting_cost, :integer
    add_reference :jobs, :users, index: true
  end
end
