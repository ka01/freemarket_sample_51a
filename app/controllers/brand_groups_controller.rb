class BrandGroupsController < ApplicationController
  def index
    @brandgroups = BrandGroup.order('id ASC')
    @brandgroup = BrandGroup.find(1)
    @brands = Brand.where(brand_group_id:@brandgroup.id)
    @brand_initials = Brand.initial_sort(@brands)
  end

  def show
    @brandgroups = BrandGroup.order('id ASC')
    @brandgroup = BrandGroup.find(params[:id])
    @brands = Brand.where(brand_group_id:@brandgroup.id)
    @brand_initials = Brand.initial_sort(@brands)
  end

end
