class ListsController<ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_user
# GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /issues/1.json
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :description, :state, :price)
    end

    def authorize_user
      unless user_signed_in? and current_user.is_admin?
        raise ActionController::RoutingError.new('Not Found')
      end
    end
end
