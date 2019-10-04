class BrandController < ApplicationController
  def index
    @brands = Brand.where(brand_group_id: params[:id]).where('name LIKE(?)',"#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
end
