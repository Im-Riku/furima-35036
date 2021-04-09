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
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :delivery_source_id
      validates :days_to_ship_id
    end
    validates :price, numericality: {greater_than: 299, less_than: 10000000}, format: { with: /\A[0-9]+\z/}
    validates :image
  end
end
