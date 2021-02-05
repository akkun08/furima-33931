class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :find_params, only: [:show, :update, :edit]

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
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    # @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
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
