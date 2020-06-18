class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :find, :show]
  before_action :set_property, only: [:show]

  def index
    @properties = Property.geocoded
    @markers = @properties.map do |prop|
      {
        lat: prop.latitude,
        lng: prop.longitude
      }
    end
  end

  def show
    @review = Review.new
  end

  def find
    @query = params[:query]
    @properties = Property.geocoded
    # @property = Property.new
    if params[:query].present?
      @properties = @properties.search_by_address(params[:query])

      @property = Property.new(address: @query)
      @property_markers = @property.geocode
      @markers = [
        {
          lat: @property_markers[0],
          lng: @property_markers[1]
        }]
    end
  end

  def new
  end

  def create
    @property = Property.new
    @property.address = params[:query]
    @property.user = current_user
    @property.geocode
    if @property.save
      redirect_to new_property_review_path(@property)
    else
      redirect_to properties_find_path
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :latitude, :longitude)
  end
end
