class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "items/new"
    end
  end

  def show
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render "items/edit"
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :delivery_fee_id, :delivery_source_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    unless current_user == @item.user
      redirect_to root_path
    end
  end

end
