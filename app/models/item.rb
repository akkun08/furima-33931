class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :state
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name, :item_detail
    validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 11 }
    validates :shipping_charge_id, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 3 }
    validates :prefecture_id, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 48 }
    validates :state_id, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 7 }
    validates :delivery_id, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 4 }
  end

  validates :category_id, :delivery_id, :prefecture_id, :shipping_charge_id, :state_id, numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
