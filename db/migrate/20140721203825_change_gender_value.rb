class ChangeGenderValue < ActiveRecord::Migration
  def change
    remove_column :users, :gender, :boolean
    add_column :users, :gender, :string
  end
end
