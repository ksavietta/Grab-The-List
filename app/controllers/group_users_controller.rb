class GroupUsersController < ApplicationController

  def create
    group = current_user.groups.find(params[:group_id])
    new_membership = group.group_users.build(group_user_params)
    if new_membership.save
      redirect_to group_path(group)
    elsif new_membership.user_id
      flash[:notice] = "This person is already in the group."
      redirect_to group_path(group)
    else
      flash[:notice] = "Uh-Oh! You found the Princess. Wronngggg, she's in another house. Looks like this person is not registered."
      redirect_to group_path(group)
    end
  end

  private

  def group_user_params
    params.require(:group_user).permit(:email_address)
  end


end