class ListingsController < ApplicationController
  def listing
    @items=Item.where(user_id:current_user.id)
  end

  def in_progress
    @items=Item.where(user_id:current_user.id)
  end

  def completed
    @items=Item.where(user_id:current_user.id)
  end
end
