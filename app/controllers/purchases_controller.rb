class PurchasesController < ApplicationController
  before_action :set_item, except: [:done]
  before_action :set_purchase, except: [:done]

  def confirmation
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to action: :done
  end

  def done
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchase
    @seller = User.find(@item.seller_id)
  end

end
