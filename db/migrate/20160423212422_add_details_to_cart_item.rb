class AddDetailsToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :type_of_delivery, :integer
  end
end
