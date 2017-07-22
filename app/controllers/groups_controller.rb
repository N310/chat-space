class GroupsController < ApplicationController
  before_action :create_group_instance, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
    @group.user_groups.build
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    update_user_belongs_group
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

  def create_group_instance
    @group = Group.find(params[:id])
  end

  def update_user_belongs_group
    @group.user_groups.each do |user_group|
      if user_group.user_id == current_user.id
        @group.update(group_params)
        redirect_to root_path, notice: 'グループを編集しました' and return
      else
        redirect_to edit_group_path, alert: 'グループメンバーではないので編集できません' and return
      end
    end
  end
end
