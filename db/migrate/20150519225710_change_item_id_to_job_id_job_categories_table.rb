class ChangeItemIdToJobIdJobCategoriesTable < ActiveRecord::Migration
  def change
    rename_column :job_categories, :item_id, :job_id
  end
end
