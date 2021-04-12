class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order(:id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    else
      render "items/new"
    end
  end

  #def show
    #@item = Item.find(params[:id])
  #end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :delivery_fee_id, :delivery_source_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
