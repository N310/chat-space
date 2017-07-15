class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.user_groups.build
  end

  def edit
  end

  def create
    @group = Group.create(group_params)
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end
