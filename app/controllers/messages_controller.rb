class MessagesController < ApplicationController
  before_action :set_group
  before_action :set_messages, only: :create

  def index
    @message = Message.new
    respond_to do |format|
      format.html do
        @messages = @group.messages
      end
      format.json do 
        if params[:lastMessageId]
          @latestMessage = @group.messages.where("id > ?", params[:lastMessageId])
        end
      end
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json
      end
    else
      flash.now[:error] = @message.errors[:base][0]
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages
  end
end
