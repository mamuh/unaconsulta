class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @properties_sample = Property.all.sample(3)
    @properties = Property.geocoded
  end
end
