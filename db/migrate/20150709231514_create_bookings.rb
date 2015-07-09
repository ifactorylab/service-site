class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.datetime :time
      t.integer :number_of_person
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :note
      t.string :site_id
      t.integer :status
      t.boolean :partner_notified
      t.boolean :customer_notified

      t.timestamps null: false
    end
  end
end
