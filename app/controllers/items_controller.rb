class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destrpy, :edit ,:update]
  before_action :authenticate_user!, only:[:new]
  before_action :set_search

  def index
    @ladies = Category.find_by(name:'レディース')
    @mens = Category.find_by(name:'メンズ')
    @item = Item.order('id DESC')
    @ladies_items = @item.inject([]){|result,n| result << n if n.category.root.name=="レディース";result}.take(4)
    @mens_items = @item.inject([]){|result,n| result << n if n.category.root.name=="メンズ";result}.take(4)
  end

  def show
    @seller = User.find(@item.seller_id)
    @before_item = Item.where.not(seller_id: current_user.id).where.not(id: @item.id).where( 'id >= ?', rand(Item.first.id..Item.last.id)).first
    @after_item = Item.where.not(seller_id: current_user.id).where.not(id: [@item.id,@before_item.id]).where( 'id >= ?', rand(Item.first.id..Item.last.id)).first
  end

  def new
    @item = Item.new
    @item.item_images.build
    @item.build_shipping
    @level1_categories = Category.where(ancestry:nil)
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :edit
      end
  end

  def destroy
    if @item.destroy
      flash[:notice] = '商品を削除しました'
      redirect_to listing_listings_path
    else
      flash[:notice] = '商品の削除に失敗しました'
      redirect_to root_path
    end
  end

  def edit
    @item_images = @item.item_images
    @level1_categories = @item.category.root.siblings
    @level2_categories = @item.category.parent.siblings
    @level3_categories = @item.category.siblings
    @size = @item.size.siblings if @item.size
  end

  def update
    if @item.update(item_params)
      flash[:notice] = '更新しました'
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_size_children
    @category = Category.find(params[:parent_id])
    @size_children = @category.size.children if @category.size
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
      :size_id,
      # :brand_id,
      shipping_attributes: [:id,
                            :fee_burden,
                            :service,
                            :area,
                            :handling_time],
      item_images_attributes: [:id,
                              :image_url,
                              :_destroy, #newとの共存可能
                              :item_id]
    ).merge(seller_id: current_user.id,trading_status:0,brand_id:2)
  end

end