class AddDetailsToBasket < ActiveRecord::Migration
  def change
    add_column :baskets, :type_of_delivery, :integer
  end
end
