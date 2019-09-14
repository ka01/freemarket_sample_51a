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
    @parents=Category.where(ancestry:nil)
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

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find(params[:parent_id]).children
  end

  def get_size_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category = Category.find(params[:parent_id])
    @size_children = @category.size.childeren


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
    ).merge(seller_id: current_user.id,trading_status:0)
  end
end