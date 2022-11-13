# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon
  validate :image_type_allowed?

  private

  def image_type_allowed?
    return if icon.blob.nil?

    allowed_types = %w[image/gif image/jpeg image/png]
    errors.add(:icon, :invalid_type) unless allowed_types.include?(icon.blob.content_type)
  end
end
