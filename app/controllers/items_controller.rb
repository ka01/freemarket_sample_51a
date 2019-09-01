class ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item = Item.new
    @item.item_images.build
    @item.build_shipping
  end

  def create
    @item = Item.new(item_params)
    # @item.build_shipping(item_params[:shipping_attributes])
    # # @item.build_item_images(item_params[:item_images_attributes])
    # @item.item_images.build(item_params[:item_image_attributes])
    # binding.pry

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
                            :handling_time],
      item_images_attributes: [:id,
                              :image_url]
    ).merge(user_id: current_user.id)
  end
end