class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.integer :status
      t.string :type_of_delivery
      t.string :integer
      t.string :address
      t.string :text
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
