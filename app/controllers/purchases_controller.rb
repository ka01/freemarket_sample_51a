class PurchasesController < ApplicationController
  before_action :set_item, except: [:done]
  before_action :set_purchase, except: [:done]

  def confirmation
  end

  def pay
    # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp.api_key = 'sk_test_1d93fdeed4300d54b904b5ea'
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    # payjpで購入するとbuyer_idにはcurrent_userのidがセットされる
    @item.buyer_id = current_user.id
    # payjpで購入するとtrading_statusに3(complete)がセットされる
    @item.trading_status = 3
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
