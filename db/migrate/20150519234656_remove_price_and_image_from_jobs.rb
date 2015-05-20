class RemovePriceAndImageFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :price
    remove_column :jobs, :image_file_name
    remove_column :jobs, :image_content_type
    remove_column :jobs, :image_file_size
    remove_column :jobs, :image_updated_at
  end
end
