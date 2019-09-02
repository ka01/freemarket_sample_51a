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
  end

  private

  def profile_params
    params.require(:user).permit(:nickname,:introduction)
  end

end
