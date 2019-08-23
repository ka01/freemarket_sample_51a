class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if  session[:provider] != nil
      params[:user][:password] =  Devise.friendly_token.first(6)
      params[:user][:password_confirmation] =  params[:user][:password]

    super #通常のDeviseによるuser登録
      # @sns.save
    SocialProfile.create(
      uid: session[:uid],
      provider: session[:provider],
      user_id: @user.id
      )
    else
      super

    end
  end

end