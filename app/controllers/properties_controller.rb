class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]
  #Shows all properties
  def index
    @properties = Property.geocoded
    @markers = @properties.map do |prop|
      {
        lat: prop.latitude,
        lng: prop.longitude
      }
    end
    # if params[:query].present?
    #   @properties = @properties.search_by_address(params[:query])
    #   if @properties.empty?
    #     flash[:alert] = "There is no reviews for this property yet."
    #     redirect_to new_property_path
    #   else
    #     redirect_to new_review_path
    #   end
    # end
  end

  def show
    @review = Review.new
    # session[:my_previous_url] = URI(request.referer || '').path
    # @back_url = session[:my_previous_url]
  end

  def find
    @query = params[:query]
    @properties = Property.geocoded
    # @property = Property.new
    if params[:query].present?
      @properties = @properties.search_by_address(params[:query])

      # if @properties.empty?
      #   flash[:alert] = "There are no reviews for this property."
      # end

      @property = Property.new(address: @query)
      @property_markers = @property.geocode
      @markers = [
        {
          lat: @property_markers[0],
          lng: @property_markers[1]
        }]

      # @markers = @properties.map do |prop|
      #   {
      #     lat: prop.latitude,
      #     lng: prop.longitude
      #   }
      # end

    end
  end

  def new
    @query = params[:query]
    @properties = Property.geocoded
    @property = Property.new(address: @query)
    @review = Review.new
    @property_markers = @property.geocode
    @markers = [
      {
        lat: @property_markers[0],
        lng: @property_markers[1]
      }]

    # if params[:query].present?
    #   @properties = @properties.search_by_address(params[:query])
    #   if @properties.empty?
    #     flash[:alert] = "There is no reviews for this property yet."
    #     redirect_to properties_path
    #   end
    # end
  end

  # Creates a new property only if the property does not exists
  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save!
      redirect_to new_property_review_path(@property)
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
