class ChangeBusinessStatusInUsersToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :users, :business_status, :boolean, default: false
  end
end
