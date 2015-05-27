class AddPendingColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :pending, :boolean, default: true
  end
end
