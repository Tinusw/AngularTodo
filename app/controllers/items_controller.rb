class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :edit, :update, :destroy, :create, :new]
  respond_to :json, :html

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    respond_with @items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    respond_with Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
    respond_with Item.new(item_params)
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    respond_with @item

    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
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
    @item.destroy
    respond_with Item.destroy(params[:id])
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
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
      params.require(:item).permit(:title, :crit)
    end
end