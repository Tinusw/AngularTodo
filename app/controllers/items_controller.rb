class ItemsController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json, :html

  # GET /items
  # GET /items.json
  def index
    @items = Item.all.to_json(:include => [:title, :crit])
    respond_with @items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id]).to_json(:include => [:title, :crit])
    respond_with @item
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.create(item_params)
    respond_with @order
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    respond_with Item.destroy(params[:id])
  end

  protected

  def json_request?
    request.format.json?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :crit, :done)
    end
end
