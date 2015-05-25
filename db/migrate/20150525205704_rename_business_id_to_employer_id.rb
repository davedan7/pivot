class RenameBusinessIdToEmployerId < ActiveRecord::Migration
  def change
    rename_column :users, :business_id, :employer_id
  end
end
