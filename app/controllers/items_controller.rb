class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_shipping
  end

  def create
    @item = Item.new(item_params)
    # Item.create(item_params[:shipping_attributes])
    @item.build_shipping(item_params[:shipping_attributes])
    binding.pry
    if @item.save
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
      :condition, 
      shipping_attributes: [:id,
                            :fee_burden,
                            :service,
                            :area,
                            :handling_time]
    ).merge(user_id: current_user.id)
  end
end