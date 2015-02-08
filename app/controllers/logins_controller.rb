class LoginsController < ApplicationController
  skip_before_action :login_check

  def new
    @user = User.new
  end

  def create
    @name = params[:name]
    @user = User.find_by_name @name
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.now.alert = "ログインに成功しました"
      redirect_to parkings_path
    else
      flash.now.alert = "ログインに失敗しました"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
