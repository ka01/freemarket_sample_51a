class ItemsController < ApplicationController

  before_action :set_item, only: [:show]

  def index
    @items = Item.order('id DESC').limit(4)
  end

  def show
    @seller = User.find(@item.seller_id)
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

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = '商品を削除しました'
      redirect_to listing_listings_path
    else
      flash[:notice] = '商品の削除に失敗しました'
      redirect_to root_path
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

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
    ).merge(seller_id: current_user.id)
  end
end