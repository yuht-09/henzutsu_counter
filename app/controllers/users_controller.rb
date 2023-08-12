class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def show
    if Average.exists?(user_id: current_user.id)
      @average = Average.where(user_id: current_user.id).average(:weather_id).round(1)
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'ユーザー登録に成功しました。'
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: 'ユーザー編集に成功しました。'
    else
      flash.now[:danger] = 'ユーザー編集に失敗しました。'
      render :edit
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
