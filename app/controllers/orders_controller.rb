class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
       @order_address.save
       redirect_to root_path
     else
       render action: :create
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def order_params
   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line_1, :address_line_2, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
