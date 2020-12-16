class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line_1, :address_line_2, :tel, :token

  validates :postal_code, :city, :address_line_1, :tel, :token, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :tel, format: { with: /\A\d{10,11}\z/ } 
  validates :prefecture_id, numericality: { other_than: 1 }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line_1: address_line_1, address_line_2: address_line_2,tel: tel, order_id: order.id)
  end
end