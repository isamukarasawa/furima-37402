class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :product_name           , presence: true
  validates :expianation            , presence: true
  validates :category_id            , presence: true
  validates :product_situation_id   , presence: true
  validates :delivery_charge_id     , presence: true
  validates :prefecturse_id         , presence: true
  validates :delivery_day_id        , presence: true
  validates :price                  , presence: true, numericality: {greater_than: 300,less_than: 9999999}, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :product_situation
  belongs_to :delivery_charge
  belongs_to :prefecturse
  belongs_to :delivery_day

  validates :category_id, :product_situation_id, :delivery_charge_id, :prefecturse_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" } 

  has_one_attached :image
  
end
