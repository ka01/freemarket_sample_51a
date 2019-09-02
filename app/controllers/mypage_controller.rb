class MypageController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def profile
    @user=current_user
  end

  def profile_update
    @user=current_user
    binding.pry
    if @user.update(profile_params)
      redirect_to root_path
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

  def profile_params
    params.require(:user).permit(:nickname)
  end

end
