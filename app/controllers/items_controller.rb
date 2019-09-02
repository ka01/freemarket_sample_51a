class ItemsController < ApplicationController
  def index
    @items = Item.order('id DESC').limit(4)
  end

  def show
    @item = Item.find(params[:id])
  end


  def new
    @item = Item.new
    @item.item_images.build
    @item.build_shipping
  end

  def create
    @item = Item.new(item_params)
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
      :category_id,
      shipping_attributes: [:id,
                            :fee_burden,
                            :service,
                            :area,
                            :handling_time],
      item_images_attributes: [:id,
                              :image_url]
    ).merge(user_id: current_user.id)
  end
end