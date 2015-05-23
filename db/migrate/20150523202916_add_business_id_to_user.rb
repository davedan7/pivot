class AddBusinessIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_id, :integer, references: :user, index: true
  end
end
