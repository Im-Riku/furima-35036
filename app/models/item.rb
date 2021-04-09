class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_source
  belongs_to :days_to_ship

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :delivery_source_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :price, numericality: {greater_than: 299, less_than: 10000000}, format: { with: /\A[0-9]+\z/}
    validates :image
  end


end
