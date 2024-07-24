class Tweet < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :tweet_tag_relations, dependent: :destroy
    has_many :tags, through: :tweet_tag_relations, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    scope :high, -> {order(price: :desc)}
    scope :low, -> {order(price: :asc)}
end
