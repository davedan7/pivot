class AddBusinessStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_status, :boolean
  end
end
