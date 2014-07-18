class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.string :type
      t.references :user, index: true
    end
  end
end
