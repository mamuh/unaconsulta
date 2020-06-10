class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]
  #Shows all properties
  def index
    @properties = Property.geocoded
    @property = Property.new
    @markers = @properties.map do |prop|
      {
        lat: prop.latitude,
        lng: prop.longitude
      }
    end
    if params[:query].present?
      @properties = @properties.search_by_address(params[:query])
      if @properties.empty?
        flash[:alert] = "There is no reviews for this property yet."
        redirect_to properties_path
      end
    end
  end

  def show
  end

  def find
    @properties = Property.geocoded
    @property = Property.new
    if params[:query].present?
      @properties = @properties.search_by_address(params[:query])

      @markers = @properties.map do |prop|
        {
          lat: prop.latitude,
          lng: prop.longitude
        }
      end

      if @properties.empty?
        flash[:alert] = "There is no reviews for this property."
        redirect_to properties_find_path
      end
    end
  end

  def new
    @property = Property.new
  end

  # Creates a new property only if the property does not exists
  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to properties_path
    else
      raise
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
  #Strong params method
  def property_params
    params.require(:property).permit(:address, :latitude, :longitude)
  end
end
