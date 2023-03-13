module TweetsHelper

  def formatted_date(tweet)
    if (Time.zone.now - tweet.created_at) > 1.day
      tweet.created_at.strftime("%b %-d")
    else
      time_ago_in_words(tweet.created_at)
    end
  end

  def like_active?(tweet, current_user)
    tweet.likes.include?(current_user.likes.find_by(tweet: tweet))
  end

  def bookmark_active?(tweet, current_user)
    tweet.bookmarks.include?(current_user.bookmarks.find_by(tweet: tweet))
  end

  def retweet_active?(tweet, current_user)
    tweet.retweets.include?(current_user.retweets.find_by(tweet: tweet))
  end


end
