class AddUsersToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :user, index: true
  end
end
