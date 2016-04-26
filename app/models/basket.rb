class Basket < ActiveRecord::Base

DELIVERY = %w(Почтой Курьерская_доставка Самовывоз)
STAT = %w(Ожидается_оплата Оплачено Доставляется Доставлено)

    has_many :cart_items
    belongs_to :user

    validates :user, presence:true
    before_validation :set_default_delivery
    before_validation :set_default_status

    def set_default_delivery
      self.type_of_delivery||=0
    end

    def delivery_name
      type_of_delivery && DELIVERY[type_of_delivery]
    end

    def set_default_status
      self.status||=0
    end

    def set_status
      self.status=0
      self.cart_items.each do |f|
        if f.status ==2
          self.status=1
        end
        if f.status ==3
          self.status=1
        end
      end
    end

    def status_name
      status && STAT[status]
    end


end
