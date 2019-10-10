class BrandCategoryController < ApplicationController
  def show
    @brand = Brand.find(params[:brand_id])
    @category = Category.find(params[:id])
    @items = Item.where(brand_id: @brand.id,category_id:@category.id)
    @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)
  end
end
