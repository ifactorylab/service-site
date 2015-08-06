class ChangeTypeToTypeIdInEmail < ActiveRecord::Migration
  def change
    remove_column :emails, :type
    add_column :emails, :type_id, :integer
  end
end
