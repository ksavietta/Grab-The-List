class ItemsController<ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :show]

  def new
    @item = Item.new
  end

  def create
    @group = Group.find(params[:group_id])
    @item = @group.items.build(item_params)

    if @item.save
      redirect_to group_path(@group),
        notice: "Your item was created successfully."
    else
      flash.now[:notice] = "There was an issue with your item. Please try again."
        redirect_to group_path(@group)
    end
  end

  def edit

  end

  def update
    if @item.update
      redirect_to @item
    else
      render 'edit'
    end
  end

  def index
    @items = Item.all
  end

  def destroy
    @group = Group.find(params[:group_id])
    @item.destroy
    redirect_to group_path(@group)
  end

  def show

  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :purchased, :list_id, :user_id, :group_id)
  end

end



