class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
   if user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     flash[:danger] = "You have updated user error"
     redirect_to books_path
   else
     @users = User.all
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
