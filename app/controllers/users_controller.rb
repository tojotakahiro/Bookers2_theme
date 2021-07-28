class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def update
    @book =Book.new
    @books =Book.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "error"
      render :edit

    end

  end

# 　def create
#     @user = User.new(user_params)
#     if @user.save
#       redirect_to root_path, success: 'successfully'
#     else
#       flash.now[:danger] = "error"
#       render :new
#     end
#   end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end