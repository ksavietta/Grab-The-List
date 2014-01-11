class HomeController<ApplicationController

  def index
    if user_signed_in?
      redirect_to groups_path
    else
      new_user_session_path
    end
  end

end