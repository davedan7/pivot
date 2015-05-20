class RenameItemCategoriesToJobCategories < ActiveRecord::Migration
  def change
    rename_table :item_categories, :job_categories
  end
end
