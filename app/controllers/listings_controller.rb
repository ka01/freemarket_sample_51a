class ListingsController < ApplicationController
  def listing
    @items=Item.where(seller_id:current_user.id,trading_status:0)
  end

  def in_progress
    @items=Item.where(seller_id:current_user.id,trading_status:1)
  end

  def completed
    @items=Item.where(seller_id:current_user.id,trading_status:2)
  end
end
