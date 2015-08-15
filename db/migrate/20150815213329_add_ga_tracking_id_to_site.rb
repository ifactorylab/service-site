class AddGaTrackingIdToSite < ActiveRecord::Migration
  def change
    add_column :sites, :ga_tracking_id, :string, default: ''
  end
end
