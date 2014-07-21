class ChangeDateIdToMatchId < ActiveRecord::Migration
  def change
    remove_column :matches, :date_id, :integer
    add_column :matches, :match_id, :integer
  end
end
