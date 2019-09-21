module PurchasesHelper

  def item_status_edit_or_item_comment?
    if user_signed_in?
      if @item.seller_id == current_user.id
        render 'items/partial/item_status_edit'
      end
    else
        render 'items/partial/item_comment'
    end
  end

end