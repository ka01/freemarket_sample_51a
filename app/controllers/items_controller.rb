class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    end
    binding.pry
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :condition).merge(user_id: current_user.id)
  end
end