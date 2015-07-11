class AddGmtOffsetToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :gmt_offset, :integer, default: 0
  end
end
