class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:top, :about]

  def top
  end

  def about
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != User.find(current_user.id)
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
