class ChangeMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :user_id, :integer
    add_column :matches, :user_id, :integer
    remove_column :matches, :accepted, :boolean
  end
end
