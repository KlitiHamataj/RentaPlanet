class RenameAcceptedBookinsToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :accepted, :status
  end
end
