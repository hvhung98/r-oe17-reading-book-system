class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :used_send
      t.integer :user_receive
      t.string :status
      t.integer :activity_id
      t.string :activity_type

      t.timestamps
    end
  end
end
