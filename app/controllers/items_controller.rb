class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  


  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    end

    def update
      @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
     render :edit
    end
  end
  
  


  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_price, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_ship_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user_id
    redirect_to root_path
  end
end

  def set_item
    @item = Item.find(params[:id])
  end



end

