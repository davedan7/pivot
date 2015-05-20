class ChangeItemsTableToJobsTable < ActiveRecord::Migration
  def change
    rename_table :items, :jobs
  end
end
