class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :find_params, only: [:show, :update, :edit, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def find_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :state_id, :shipping_charge_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end
end
