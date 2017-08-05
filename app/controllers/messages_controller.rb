class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = @group.messages.build
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:error] = @message.errors[:base][0]
      @group = Group.find(params[:group_id])
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
