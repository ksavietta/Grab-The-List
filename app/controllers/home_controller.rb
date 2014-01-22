class HomeController<ApplicationController

  def index
    if user_signed_in? && (current_user.groups.count > 0)
      redirect_to group_path(current_user.default_group)
    elsif user_signed_in?
      redirect_to new_group_path
    else
      new_user_registration_path
    end
  end

end