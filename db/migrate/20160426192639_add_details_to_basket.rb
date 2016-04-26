class AddDetailsToBasket < ActiveRecord::Migration
  def change
    add_column :baskets, :price, :integer
  end
end
