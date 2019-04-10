class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.string :activity_type
      t.integer :activity_id

      t.timestamps
    end
  end
end
