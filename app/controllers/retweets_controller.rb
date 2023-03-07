class RetweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @retweets = current_user.retweets.create(tweet: tweet)
    if @retweets.save
      redirect_to dashboard_path
    end
  end

  def destroy
    @retweets = tweet.retweets.find(params[:id])
    @retweets.destroy
    redirect_to dashboard_path
  end

  private

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end
end