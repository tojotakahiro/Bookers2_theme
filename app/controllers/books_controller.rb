class BooksController < ApplicationController

  def edit
     @book = Book.find(params[:id])
     @user = User.find(params[:id])
     if @book.user == current_user
       render "edit"
     else
       redirect_to books_path
     end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = 'You have updated user successfully.'
    else
      flash[:alert] = "error"
      @books = Book.all
      @user = current_user
      render :index

    end
  end

  def index
    @books = Book.all
    @book = Book.new
    # @user = @books.user
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book =Book.find(params[:id])
    @books = Book.all
    @user = current_user
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else

      flash[:alert] = "error"
      render :edit
    end
    flash[:success] = 'You have updated user successfully.'
  end



  private
  def book_params
    params.require(:book).permit(:title, :body, :name)
  end

end
