class BrandGroupsController < ApplicationController
  def index
    @brandgroups=BrandGroup.order('id ASC')
  end

  def show
    @brandgroups = BrandGroup.order('id ASC')
    @brandgroup = BrandGroup.find(params[:id])
    @brands = Brand.where(brand_group_id:@brandgroup.id)
    @brand_initials = @brands.inject([]){|result,n| result << n.name[0] unless result.include?(n.name[0]);result}.sort!
  end


end
