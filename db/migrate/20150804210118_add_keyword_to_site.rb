class AddKeywordToSite < ActiveRecord::Migration
  def change
    add_column :sites, :keywords, :text, default: ''
  end
end
