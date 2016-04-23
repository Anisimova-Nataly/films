class Basket < ActiveRecord::Base

DELIVERY = %w(Почтой Курьерская_доставка Самовывоз)


    has_many :cart_items
    belongs_to :user

    before_validation :set_default_delivery

    def set_default_delivery
      self.type_of_delivery||=0
    end

    def delivery_name
      type_of_delivery && DELIVERY[type_of_delivery]
    end

end
