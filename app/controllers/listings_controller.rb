class ListingsController < ApplicationController
  def listing
    @items=Item.where(user_id:current_user.id)
  end

  def in_progress
    @items=Item.find(1,2)
  end

  def completed
    @items=Item.find(3,4)
  end
end
