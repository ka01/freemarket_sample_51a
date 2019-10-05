class SignupController < ApplicationController
  before_action :validates_step2, only: :step3
  before_action :validates_step5, only: :create

  def step1
  end

  def reset
    session[:nickname]=nil
    session[:email]=nil
    session[:provider]=nil
    session[:password]=nil
    session[:password_confirmation]=nil
    redirect_to step2_signup_index_path
  end

  def step2
    @user = User.new
  end

  def step3
  end

  def step4
  end

  def step5
    @user = User.new
    @user.build_deliver_adress
  end

  def step6
    #非ログインユーザーでもsignup/step6に飛べてしまうバグを発見した為
    #sessionを持っていない場合はindexにリダイレクトするよう修正
    if session[:id]

    else
      redirect_to root_path
    end
  end

  def step7
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )
    @user.build_deliver_adress(user_params[:deliver_adress_attributes])
    if @user.save
      if session[:provider] != nil
        SocialProfile.create(
          uid: session[:uid],
          provider: session[:provider],
          user_id: @user.id
          )
      end
      session[:id] = @user.id
      redirect_to step6_signup_index_path
    else
      render step1_signup_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      deliver_adress_attributes: [:id,
                                  :family_name,
                                  :first_name,
                                  :family_name_kana,
                                  :first_name_kana,
                                  :postcode,
                                  :prefecture_code,
                                  :city,
                                  :adress1,
                                  :adress2,
                                  :telephone]
    )
  end


  def validates_step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    if  session[:provider] != nil
      session[:password] = Devise.friendly_token.first(6)
      session[:password_confirmation] =session[:password]
    else
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
    end
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )
    render step2_signup_index_path unless @user.valid?
  end

  def validates_step5
    session[:family_name] = params[:user][:deliver_adress_attributes][:family_name]
    session[:first_name] = params[:user][:deliver_adress_attributes][:first_name]
    session[:family_name_kana] =  params[:user][:deliver_adress_attributes][:family_name_kana]
    session[:first_name_kana] = params[:user][:deliver_adress_attributes][:first_name_kana]
    session[:postcode] = params[:user][:deliver_adress_attributes][:postcode]
    session[:prefecture_code] = params[:user][:deliver_adress_attributes][:prefecture_code]
    session[:city] = params[:user][:deliver_adress_attributes][:city]
    session[:adress1] = params[:user][:deliver_adress_attributes][:adress1]
    session[:telephone] = params[:user][:deliver_adress_attributes][:telephone]

    @user = User.new
    @user.build_deliver_adress
    @deliver_adress = DeliverAdress.new(
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      postcode: session[:postcode],
      prefecture_code: session[:prefecture_code],
      city: session[:city],
      adress1: session[:adress1],
      telephone: session[:telephone],
    )
    render step5_signup_index_path unless @deliver_adress.valid?
  end
end
