class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @properties_sample = Property.all.sample(3)
    @properties = Property.new
    if params[:query].present?

    end
  end

  def profile
  end
end
