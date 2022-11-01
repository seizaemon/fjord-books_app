# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon
  validate :icon_image_type

  private

  def icon_image_type
    format_allowed = %w[image/gif image/jpeg image/png]
    errors.add :icon, :invalid_format, message: I18n.t('activerecord.models.errors.icon.invalid_format') unless format_allowed.include?(icon.blob.content_type)
  end
end
