class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails, id: :uuid do |t|
      t.string :site_id
      t.text :content
      t.integer :type

      t.timestamps null: false
    end
  end
end
