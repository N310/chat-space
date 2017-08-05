class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = @group.messages.build
  end

  def create
    @message = Message.new(message_params)
    unless @message.save
      flash[:error] = @message.errors[:base][0]
    end
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
