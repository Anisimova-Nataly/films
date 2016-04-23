class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :cover_file_name
      t.integer :cover_file_size
      t.string :cover_content_type
      t.datetime :cover_updated_at
      t.text :name
      t.integer :price
      t.integer :amount
      t.integer :film_id

      t.timestamps null: false
    end
  end
end
