class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_item_image
    @item.build_shipping
  end

  def create
    @item = Item.new(item_params)
    @item.build_shipping(item_params[:shipping_attributes])
    # @item.build_item_images(item_params[:item_images_attributes])
    @item.build_item_images(image_url)
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
                            :handling_time],
      item_image_attributes: [:id,
                              :image_url]
    ).merge(user_id: current_user.id)
  end
end