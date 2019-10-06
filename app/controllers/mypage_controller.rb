class MypageController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def profile
    @user=current_user
  end

  def profile_update
    @user=current_user
    if @user.update(profile_params)
      flash[:notice] = 'プロフィールを更新しました'
      redirect_to profile_mypage_index_path
    else
      render :profile
    end
  end

  def notification
  end

  def todo
  end

  def purchase
  end

  def purchased
  end

  def logout
  end

  def card
  end

  def identification
    if Identification.where(user_id:current_user.id).present?
      @identification = current_user.identification
    else
      @identification = Identification.new
    end
  end

  def identification_update
    if Identification.where(user_id:current_user.id).present?
      @identification = current_user.identification
      if @identification.update(identification_params)
        flash[:notice] = '本人情報を更新しました'
        redirect_to identification_mypage_index_path
      else
        render :identification
      end
    else
      @identification = Identification.new(identification_params)
      if @identification.save
        flash[:notice] = '本人情報を登録しました'
        redirect_to identification_mypage_index_path
      else
        render :identification
      end
    end
  end
  def like
    @likes = Like.where(user_id: current_user.id)
    @items = []
    @likes.map{|target| @items.push(target.item).flatten!}
    @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)  end
  private

  def profile_params
    params.require(:user).permit(:nickname,:introduction)
  end
  def identification_params
    params.require(:identification).permit(:postcode,:prefecture_code,:city,:address1,:address2).merge(user_id: current_user.id)
  end
end
