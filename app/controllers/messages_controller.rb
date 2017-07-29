class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = @group.messages.build
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:body, :image)
  end
end
