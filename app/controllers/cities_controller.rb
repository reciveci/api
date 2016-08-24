include Utils
class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  respond_to :html
  after_filter :cors_set_access_control_headers

  def getAffliation(city)
    puts city.name
    url_prefix = serverUrl(request)
    # affiliations = Affiliation.where(ciudad:ciudad)
    affiliations = Affiliation.where(city:city)
    puts affiliations.size
    resultAff = Array.new
    affiliations.each do |aff|
      puts aff.publish
      if(aff.publish==true)
      puts aff.id
      resultAff << {
        id: aff.id,
        nombre:aff.name,
        ciudad:aff.city.name,
        sector: aff.sector,
        direccion: aff.direccion,
        telefono: aff.phone1,
        latitud:aff.latitude,
        longitud:aff.longitud,
        email: aff.email,
        image_url:aff.image_url ? url_prefix + aff.image_url : nil,
        publish: aff.publish,
        extension:aff.extension
      }
    end
    end
    resultAff

  end


  def affXcity

    url_prefix = serverUrl(request)
      cities=City.all.order('name ASC')
      @result = Array.new


    cities.each do |city|
      puts '--------------------->'
      puts city
      acopio=getAffliation(city);
      if(acopio.length>0)
      @result << {
        id:city.id,
        Ciudad:city.name,
        CentrosAcopio:acopio
        }
      end
    end


    respond_to do |format|
      format.json { render json: @result }
    end
  end





  def index
    @cities = City.all
    end

  def show
    respond_with(@city)
  end

  def new
    @city = City.new
    respond_with(@city)
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    @city.save
    respond_with(@city)
  end

  def update
    @city.update(city_params)
    respond_with(@city)
  end

  def destroy
    @city.destroy
    respond_with(@city)
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
