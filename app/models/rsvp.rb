class Rsvp < ActiveRecord::Base
  extend FriendlyId
  friendly_id :registration_code, use: :slugged

  validates :email, presence: true
  validates :name, presence: true

  def registration_code=(value)
    attribute_will_change!('registration_code') if registration_code != value
    @registration_code = value
  end

  def registration_code
    if @registration_code.present?
      @registration_code
    else
      @registration_code = generate_registration_code
      attribute_will_change!('registration_code')
    end
  end

  def generate_registration_code
    SecureRandom.hex(2)
  end

  def registration_code_changed?
    changed.include?('registration_code')
  end

  def should_generate_new_friendly_id?
    slug.nil? || registration_code_changed?
  end
end
