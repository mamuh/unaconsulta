class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @properties_sample = Property.all.sample(3)
    @properties = Property.new
    @home_page = true
  end

  def profile
    @review_prop_ids = current_user.reviews.map do |review|
      review.property_id
    end
    @reviews_number = @review_prop_ids.uniq.count
  end

  def user_reviews

  end
end
