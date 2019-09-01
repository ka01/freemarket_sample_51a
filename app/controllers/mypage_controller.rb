class MypageController < ApplicationController
  before_action :authenticate_user!
  def index
    @user=User.find(current_user.id)
  end

  def profile
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

end
