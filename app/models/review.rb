class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :content, presence: true
  validates :stars, presence: true, numericality: { only_integer: true }, inclusion: { in: (1..5) }
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if checkout.blank? || checkin.blank?

    if checkout < checkin
      errors.add(:checkout, "must be after the check-in date")
    end
  end
end
