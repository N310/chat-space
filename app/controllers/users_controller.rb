class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    render template: "messages/index"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
