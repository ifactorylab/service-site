class ChangeStatusTypeToStringInBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :status
    remove_column :bookings, :partner_notified
    remove_column :bookings, :customer_notified
    add_column :bookings, :status, :string, default: "requested"
    add_column :bookings, :partner_notified, :boolean, default: false
    add_column :bookings, :customer_notified, :boolean, default: false
  end
end
