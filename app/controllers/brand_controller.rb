class BrandController < ApplicationController
  def index
    @brands = Brand.where(brand_group_id: params[:id]).where('name LIKE(?)',"#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id:@brand.id)
    @count = @items.count
    @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)
    @categories = @brand.brand_group.categories.inject([]){|result,n| result << n if n.childless? ;result}.sort_by{rand}
  end
end