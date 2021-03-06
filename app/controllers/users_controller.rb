class UsersController < ApplicationController
  def new
    @book = Book.new
  end
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to current_user
      end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to  user_path(@user)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
