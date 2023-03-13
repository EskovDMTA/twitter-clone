class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_tweets, through: :bookmarks, source: :tweet

  has_many :retweets, dependent: :destroy
  has_many :retweeted_tweets, through: :retweets, source: :tweet

  has_many :followings, dependent: :destroy
  has_many :following_users, through: :followings, source: :following_user
  has_many :reverse_followings, foreign_key: :following_user_id, class_name: "Following"
  has_many :followers, through: :reverse_followings, source: :user

  validates :username, uniqueness: { case_sensetive: false }, allow_blank: true 

  before_save :set_display_name, if: -> { display_name.blank? }

  def set_display_name
    self.display_name = username.humanize
  end

end
