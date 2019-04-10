class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.references :book, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
