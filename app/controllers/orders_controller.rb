class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
     else
       render action: :create
     end
  end
 
  private
  
  def order_params
   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line_1, :address_line_2, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_99b16f3935750ee8e169b41c"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
