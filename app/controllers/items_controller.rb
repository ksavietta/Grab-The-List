class ItemsController<ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :show]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render 'new'
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
    @item.destroy
    redirect_to items_path
  end

  def show

  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :purchased, :list_id)
  end

end