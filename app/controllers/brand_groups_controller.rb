class BrandGroupsController < ApplicationController
  def index
    @brandgroups=BrandGroup.order('id ASC')
  end

  def show
  end
end
