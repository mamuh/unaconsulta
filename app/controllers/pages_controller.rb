class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @properties_sample = Property.all.sample(3)
    @properties = Property.new
    @home_page = true
  end

  def profile
  end
end
