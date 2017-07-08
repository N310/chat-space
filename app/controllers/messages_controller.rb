class MessagesController < ApplicationController
  before_action :redirect_signin
  def index
  end

  private
  def redirect_signin
    redirect_to new_user_session_path unless user_signed_in?
  end
end
