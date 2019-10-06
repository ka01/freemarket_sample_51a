class ListingsController < ApplicationController
  def listing
    @items=Item.where(seller_id:current_user.id,trading_status:0..1).order("created_at DESC").page(params[:page]).per(12)
  end

  def in_progress
    @items=Item.where(seller_id:current_user.id,trading_status:2).order("created_at DESC").page(params[:page]).per(12)
  end

  def completed
    @items=Item.where(seller_id:current_user.id,trading_status:3).order("created_at DESC").page(params[:page]).per(12)
  end
end
