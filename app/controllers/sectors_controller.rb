class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]
  before_action :prepare_cities, only: [:new, :edit]
  before_action :prepare_colors, only: [:new, :edit]

  respond_to :html

  def index
    @sectors = Sector.all
    respond_with(@sectors)
  end

  def show
    respond_with(@sector)
  end

  def new
    @sector = Sector.new
    respond_with(@sector)
  end

  def edit
  end

  def create
    @sector = Sector.new(sector_params)
    @sector.save
    respond_with(@sector)
  end

  def update
    @sector.update(sector_params)
    respond_with(@sector)
  end

  def destroy
    @sector.destroy
    respond_with(@sector)
  end

  private
    def set_sector
      @sector = Sector.find(params[:id])
    end

    def sector_params
      params.require(:sector).permit(:name, :enabled, :city_id, :color_id)
    end

    def prepare_cities
      @cities = City.all
    end

    def prepare_colors
      @colors = Color.all
    end
end
