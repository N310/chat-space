class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.user_groups.build
  end

  def edit
  end

  def create
    @group = Group.create(group_params)
    redirect_to root_path, flash: {update: 'グループを作成しました'}
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end
