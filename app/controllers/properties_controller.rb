class PropertiesController < ApplicationController
  
  #Shows all properties
  def index
    @properties = Property.all
  end

  # Creates a new property only if the property does not exists
  def create
    @property = Property.new(property_params)
    @property.user = current_user
    
    if @property.save
      redirect_to property_path(@property)
    else
      render "new"
    end
  end


  def new
    @property = Property.new
  end

  private

  #Strong params method
  def property_params
    params.require(:property).permit(:address, :lat, :long)
  end
end
