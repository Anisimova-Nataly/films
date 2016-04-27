class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  # GET /baskets.json
  def index

    @baskets = Basket.all.page(params[:page ] )
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
    @basket.set_price
    if params[:st]
      if @basket.address || @basket.type_of_delivery == '2'

        if params[:st]==1
          p=0
          @basket.cart_items.each do |c|
            if c.amount.to_i > c.dvd.amount
              p=1
            end
          end
          if p==0
            @basket.cart_items.each do |c|
              c.dvd.amount= c.dvd.amount- c.amount.to_i
              c.dvd.amount.save
            end
          else
            redirect_to @basket, notice: 'Нет в наличии'
          end
        else
          @basket.status=params[:st]
          @basket.save
        end
      else
        redirect_to @basket, notice: 'Не указан адрес'
      end
    end

  end

  # GET /baskets/new
  def new
    @basket = Basket.new(user:@current_user)

  end

  # GET /baskets/1/edit
  def edit
    @basket.set_price
    if params[:st]
      if @basket.address || @basket.type_of_delivery == '2'

        if params[:st]==1
          p=0
          @basket.cart_items.each do |c|
            if c.amount.to_i >c.dvd.amount
              p=1
            end
          end
          if p==0
            @basket.cart_items.each do |c|
              c.dvd.amount= c.dvd.amount - c.amount.to_i
              c.dvd.amount.save
            end
          else
            redirect_to @basket, notice: 'Нет в наличии'
          end
        else
          @basket.status=params[:st]
          @basket.save
        end
      else
        redirect_to @basket, notice: 'Не указан адрес'
      end
    end

end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(basket_params)
    @basker.status = 0
    @cart_item.basket.set_price
    @basker.user = @current_user
    respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
        format.json { render :show, status: :created, location: @basket }
      else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    @basket.set_price
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: 'Basket was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_params
      params.require(:basket).permit(:status, :type_of_delivery, :integer, :address, :text, :user_id)
    end
end
