class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :cannot_transition, only: [:index, :create]

  def index
    @purchase_purchase_address = PurchasePurchaseAddress.new
  end

  def create
    @purchase_purchase_address = PurchasePurchaseAddress.new(purchase_params)
    if @purchase_purchase_address.valid?
      pay_item
      @purchase_purchase_address.save
      redirect_to root_path
    else
      render "purchases/index"
    end
  end

  private

  def purchase_params
    params.require(:purchase_purchase_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: "jpy",
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def cannot_transition
    if @item.purchase.present? || (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end
end
