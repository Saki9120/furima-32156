class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :name, :description, :price, presence: true

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
  
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user, foreign_key: true
  has_one    :purchase

end
