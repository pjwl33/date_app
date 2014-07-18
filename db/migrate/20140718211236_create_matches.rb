class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :user, index: true
      t.integer :date_id

      t.timestamps
    end
  end
end
