class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
  end

  def new
  end



  private

  def item_params
    params.require(:item).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
