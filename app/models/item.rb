class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :product_name, presence: true
  validates :expianation, presence: true
  validates :category_id, presence: true
  validates :product_situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }
  validates :image, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :product_situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one :order

  validates :category_id, :product_situation_id, :delivery_charge_id, :prefecture_id, :delivery_day_id,
            numericality: { other_than: 1 }

  has_one_attached :image
end
