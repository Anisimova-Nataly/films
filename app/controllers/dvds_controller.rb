class DvdsController < ApplicationController
  before_action :check_authentication, except: :index
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]

  # GET /dvds
  # GET /dvds.json
  def index
    @dvds = Dvd.all
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
  end

  # GET /dvds/new
  def new
    @dvd = Dvd.new
  end



  # GET /dvds/1/edit
  def edit
  end

  # POST /dvds
  # POST /dvds.json
  def create

    @dvd = Dvd.new(dvd_params)
    if not @dvd.cover?
      @dvd.cover = @dvd.film.cover
    end
    if @dvd.save
      redirect_to @dvd, notice: 'Диск создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /dvds/1
  # PATCH/PUT /dvds/1.json
  def update
    if @dvd.update(dvd_params)
      redirect_to @dvd, notice: 'Диск изменен.'
    else
      render :edit
    end
  end

  # DELETE /dvd/1
  # DELETE /dvd/1.json
  def destroy
    if @dvd.destroy
      redirect_to dvds_url, notice: 'Диск удален.'
    else
      render_error("Удаление диска невозможно", url: @dvd)
    end
  end

  private

    def set_dvd
      @dvd = Dvd.full.find(params[:id])
    end

    def dvd_params
      params.require(:dvd).permit(:film_id,:cover_type, :cover, :name, :price, :amount)
    end

    def check_edit
      render_error unless Dvd.edit_by?(@current_user)
    end
end
