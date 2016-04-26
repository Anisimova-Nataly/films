class Basket < ActiveRecord::Base

DELIVERY = %w(Почтой Курьерская_доставка Самовывоз)
STAT = %w(Ожидается_оплата Оплачено Доставляется Доставлено)

    has_many :cart_items
    belongs_to :user

    validates :user, presence:true
    validates :status, presence:true
    before_validation :set_default_delivery
    before_validation :set_default_status


    def self.edit_by?(u)
      u.try(:admin?)
    end

    def set_price
      pr=0
      self.cart_items.each  do |c|
        pr =pr + c.price*c.amount.to_i
      end
      self.price=pr
    end

    def set_default_delivery
      self.type_of_delivery||=0
    end

    def delivery_name
      type_of_delivery && DELIVERY[type_of_delivery]
    end

    def set_default_status
      self.status||=0
    end

    def status_name
      status && STAT[status]
    end

    def set_status(s)
      self.status = s
    end
end
