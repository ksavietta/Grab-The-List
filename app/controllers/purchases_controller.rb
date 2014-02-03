class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_user

# GET /purchases
  # GET /purchases.json
  def index
    @group = Group.find(params[:group_id])
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @group = Group.find(params[:group_id])
  end

  # GET /purchases/new
  def new
    @group = Group.find(params[:group_id])
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
    @group = Group.find(params[:group_id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @group = Group.find(params[:group_id])
    @user = current_user
    @group_user = GroupUser.where(group_id: params[:group_id], user_id: current_user.id).first
    @purchase = @group_user.purchases.build(purchase_params)
    if @purchase.make_purchase(purchase_params[:item_ids])
      redirect_to group_purchase_path(@group, @purchase), notice: 'purchase was successfully created!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /issues/1.json
  def update
    @group = Group.find(params[:group_id])
    if @purchase.update(purchase_params)
      redirect_to group_purchase_path(@group,@purchase), notice: 'purchase was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @group = Group.find(params[:group_id])
    @purchase.destroy
    redirect_to group_purchases_path(@group)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white purchase through.
    def purchase_params
      params.require(:purchase).permit(:cost, :user_id, :group_id, :receipt_photo, item_ids: []  )
    end

    def authorize_user
      unless user_signed_in? and current_user.is_admin?
        raise ActionController::RoutingError.new('Not Found')
      end
    end
end
