class CategoryController < ApplicationController
  def index
    @categories=Category.where(ancestry:nil)
  end

  def show
    @category = Category.find(params[:id])
    @children=@category.children.sort_by{rand}
    @items=[]
    @category.subtree.map{|target| @items.push(target.items).flatten!}
  end
end
