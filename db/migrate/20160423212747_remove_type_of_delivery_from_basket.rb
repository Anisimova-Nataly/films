class RemoveTypeOfDeliveryFromBasket < ActiveRecord::Migration
  def change
    remove_column :baskets, :type_of_delivery, :string
  end
end
