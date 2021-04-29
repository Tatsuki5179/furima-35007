class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item 

  def index 
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def product_params
    params.permit(:product)

  end

  def addresse_params
    params.permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :image).merge(product_id: @product.id)
  end

  def set_item
   @item = Item.find(params[:item_id])
  end
end