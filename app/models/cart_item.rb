class CartItem < ActiveRecord::Base
  has_attached_file :cover, styles: {medium: "250x250>", thumb: "100x100>"}
  belongs_to :dvd
  belongs_to :basket
  validates :amount, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates_attachment :cover, content_type: {content_type: /\Aimage\/.*\z/}
end
