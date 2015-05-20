class ChangeOrdersTableToApplication < ActiveRecord::Migration
  def change
    rename_table :orders, :applications
  end
end
