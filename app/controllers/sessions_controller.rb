class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      flash[:notice] = "ログインしました"
      redirect_to :root
    else
      flash.now[:alert] = "メールアドレスかパスワードどちらかが正しくありません"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:alert] = "ログアウトしました"
    redirect_to :root
  end

end
