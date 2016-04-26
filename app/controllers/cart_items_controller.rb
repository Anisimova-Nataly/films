class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @dvd = Dvd.find(params[:disk])
    @cart_item = CartItem.new(price: @dvd.price, cover: @dvd.cover, dvd:  @dvd, amount:1)
  end

  # GET /cart_items/1/edit
  def edit
  end


  # POST /cart_items
  # POST /cart_items.json
  def create

    @cart_item = CartItem.new(cart_item_params)
    @cart_item.price = @cart_item.dvd.try(:price)
    if @current_user.baskets.find_by status:0
      @cart_item.basket = @current_user.baskets.find_by status:0
    else
      @cart_item.basket=@current_user.baskets.create(status: 0)
    end
    @cart_item.cover = @cart_item.dvd.try(:cover)


  #  @cart_item.price = @dvd.price
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to basket_url(@cart_item.basket), notice: 'Ваш заказ обрабатывается.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Информация о заказаном диске обновлена .' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def pay
    @cart_item.status = 2
  end



  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    # Use callbacks to share common setup or constraints between actions.
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to basket_url(@cart_item.basket), notice: 'Диск удален из конрзины.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:amount, :dvd_id, :basket_id, :cover, :status, :address, :type_of_delivery)
    end
end
