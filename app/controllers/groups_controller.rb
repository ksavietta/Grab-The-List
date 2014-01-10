class GroupsController<ApplicationController
before_action :set_group, only: [:edit, :update, :destroy, :show]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      current_user.groups << @group
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  def index
    if user_signed_in?
      @groups = current_user.groups
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  def show
    @groups = current_user.groups
    @item = Item.new

  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end


end