class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :multinav_category
  before_action :set_search

  def configure_permitted_parameters
    added_attrs=[:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)

  end

  def search
    @q = Item.ransack()
    @categories = Category.where(ancestry: nil)
    @new_items = Item.order('id DESC').limit(24)
    if params[:q].present?
      @q = Item.ransack(search_params)
      @search_result = @q.result(distinct: true).order('id DESC')
    else
      params[:q] = { sorts: 'id desc'}
      @items = Item.all
    end
  end

  private

  def production?
    Rails.env.production?
  end
  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def multinav_category
    @header_categories = Category.where(ancestry: nil)
  end

  def set_search
    @q = Item.search(params[:q])
  end

  def search_params
    params.require(:q).permit(:name_cont,
                              :price_gteq,
                              :price_lteq,
                              :category_id_eq,
                              :sorts,
                              :trading_status_eq_any,
                              :condition_eq_any,
                              :shipping_fee_burden_eq_any
                              )
  end

end
