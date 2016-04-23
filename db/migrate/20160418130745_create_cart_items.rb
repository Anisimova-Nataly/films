class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :price
      t.string :amount
      t.string :integer
      t.integer :dvd_id
      t.integer :basket_id

      t.timestamps null: false
    end
  end
end
