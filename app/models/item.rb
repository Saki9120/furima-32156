class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :name, :description, :price, :image, presence: true
  validates :price, inclusion: { in: 300..9999999 }
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
  
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :order
  has_one_attached :image

end