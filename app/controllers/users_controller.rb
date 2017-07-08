class UsersController < ApplicationController
  def edit
    @user = define_user
  end

  def update
    user = define_user
    if user.id == current_user.id
      user.update!(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def define_user
    User.find(params[:id])
  end
end
