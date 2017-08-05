class MessagesController < ApplicationController
  def index
    create_group_message_instance
    @message = @group.messages.build
  end

  def create
    create_group_message_instance
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:error] = @message.errors[:base][0]
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def create_group_message_instance
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end
end
