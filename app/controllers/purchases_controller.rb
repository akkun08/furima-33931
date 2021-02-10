class PurchasesController < ApplicationController
  def index
    @item = Item.find_by(params[:id])
    @purchase_purchase_address = PurchasePurchaseAddress.new
  end

  def create
    @item = Item.find_by(params[:id])
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
end
