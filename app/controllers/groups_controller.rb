class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.user_groups.build
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, flash: {update: 'グループを作成しました'} and return
    else
      render :new and return
    end
    redirect_to new_group_path
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end
