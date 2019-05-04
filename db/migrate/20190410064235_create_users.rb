class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.references :role, default: 1, foreign_key: true
      t.string :name
      t.string :email
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
