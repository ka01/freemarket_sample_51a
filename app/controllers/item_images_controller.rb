class ItemImagesController < ApplicationController
  def destroy
    params[:ids].each do |id|
      @item_image = ItemImage.find_by(id:id)
      @item_image.destroy
    end
  end
end
