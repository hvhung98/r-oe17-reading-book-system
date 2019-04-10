class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :role, foreign_key: true, default: 1
      t.string :name
      t.string :email
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
