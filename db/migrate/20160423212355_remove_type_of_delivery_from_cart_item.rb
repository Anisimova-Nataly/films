class RemoveTypeOfDeliveryFromCartItem < ActiveRecord::Migration
  def change
    remove_column :cart_items, :type_of_delivery, :string
  end
end
