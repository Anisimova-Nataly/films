class Dvd < ActiveRecord::Base
    has_attached_file :cover, styles: {medium: "250x250>", thumb: "100x100>"}

    belongs_to :film
    has_many :cart_item

    validates :name, presence: true
    validates :price, presence: true, numericality: {only_integer: true, greater_than: 0}
  
    validates :cover_type, presence:true
    validates_attachment :cover, content_type: {content_type: /\Aimage\/.*\z/}
    scope :full, -> { includes(:film) }

    def self.edit_by?(u)
      u.try(:admin?)
    end
end
