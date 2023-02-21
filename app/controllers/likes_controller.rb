class LikesController < ApplicationController 
    def create
        @likes = current_user.likes.create(tweet: tweet)
        if @likes.save
            redirect_to dashboard_path
        end
    end

    def destroy
        @likes = tweet.likes.find(params[:id])
        @like.destroy
        redirect_to dashboard_path


    end

    private 

    def tweet
        @tweet ||= Tweet.find(params[:tweet_id])
    end
end