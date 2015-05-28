class AddDefaultPostingCostToJob < ActiveRecord::Migration
  def change
    change_column :jobs, :posting_cost, :integer, default: 100
  end
end
