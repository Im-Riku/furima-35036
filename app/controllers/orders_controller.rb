class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :order_present

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render "orders/index"
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :buyer_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def order_present
    if @item.order.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
