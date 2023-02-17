# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relations, class_name: 'FollowRelation', foreign_key: 'followee_id', dependent: :destroy, inverse_of: 'followee'
  has_many :passive_relations, class_name: 'FollowRelation', foreign_key: 'follower_id', dependent: :destroy, inverse_of: 'follower'
  has_many :followings, through: :active_relations, source: 'follower'
  has_many :followers, through: :passive_relations, source: 'followee'

  def follow(other_user)
    active_relations.create(follower_id: other_user.id)
  end

  def unfollow(other_user)
    active_relations.find_by(follower_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
