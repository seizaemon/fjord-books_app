# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon
  validate :image_type_should_be_valid

  private

  ALLOWED_IMAGE_TYPES = %w[image/gif image/jpeg image/png].freeze
  def image_type_should_be_valid
    return if icon.blob.nil?

    errors.add(:icon, :invalid_type) unless ALLOWED_IMAGE_TYPES.include?(icon.blob.content_type)
  end
end
