class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item 

  def index 
    @product_addresse = ProductAddresse.new
  end

  def create
    @product_addresse = ProductAddresse.new(product_params)
    if @product_addresse.valid?
      pay_item
      @product_addresse.save
     redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def product_params
    params.permit(:product_addresse).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.product_price,  
        card: product_addresse_params[:token],    
        currency: 'jpy'                 
      )
  end

  def addresse_params
    params.permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :image).merge(product_id: @product.id)
  end

  def set_item
   @item = Item.find(params[:item_id])
  end
end