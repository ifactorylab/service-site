class DeleteTimeAddDatetimeToBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :date
    remove_column :bookings, :time
    add_column :bookings, :datetime, :datetime
  end
end
