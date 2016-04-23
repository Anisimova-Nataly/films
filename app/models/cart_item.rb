class CartItem < ActiveRecord::Base


DELIVERY = %w(Почтой Курьерская_доставка Самовывоз)


  has_attached_file :cover, styles: {medium: "250x250>", thumb: "100x100>"}
  belongs_to :dvd
  belongs_to :basket
  validates :amount, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates_attachment :cover, content_type: {content_type: /\Aimage\/.*\z/}
  validates :address, presence: true
  validates :type_of_delivery, presence: true

  before_validation :set_default_delivery

  def set_default_delivery
    self.type_of_delivery||=0
  end

  def delivery_name
    type_of_delivery && DELIVERY[type_of_delivery]
  end




end
