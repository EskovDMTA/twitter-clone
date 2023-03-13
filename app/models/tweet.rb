class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user

  has_many :retweets, dependent: :destroy
  has_many :retweeted_users, through: :retweets, source: :user

  has_and_belongs_to_many :hashtags
  belongs_to :parent, class_name: "Tweet",
             optional: true, counter_cache: :reply_tweets_count

  has_many :reply_tweets, class_name: "Tweet",
           foreign_key: :parent_id, dependent: :destroy



  scope :order_desc, -> { order(created_at: :desc) }
end
