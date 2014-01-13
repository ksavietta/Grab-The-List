class HomeController<ApplicationController

  def index
    if user_signed_in?
      redirect_to group_path(current_user.default_group)
    else
      new_user_session_path
    end
  end

end