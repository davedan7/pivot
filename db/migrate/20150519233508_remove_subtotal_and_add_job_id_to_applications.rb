class RemoveSubtotalAndAddJobIdToApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :subtotal
    add_reference :applications, :jobs
  end
end
