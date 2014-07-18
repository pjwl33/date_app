class ChangeTypeToNameInDislikes < ActiveRecord::Migration
  def change
    remove_column :dislikes, :type, :string
    add_column :dislikes, :name, :string
  end
end
