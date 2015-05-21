class ChangeUsersIdToUserId < ActiveRecord::Migration
  def change
    rename_column :jobs, :users_id, :user_id
  end
end
