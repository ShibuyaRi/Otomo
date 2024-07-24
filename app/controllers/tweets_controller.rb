class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tweets = Tweet.all


        if params[:latest]
          @tweets = Tweet.latest
        elsif params[:old]
          @tweets = Tweet.old
        elsif params[:like]
          @tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        elsif params[:high]
          @tweets = Tweet.high
        elsif params[:low]
          @tweets = Tweet.low
        elsif params[:tag_ids].present?
          @tags = Tag.where(id: params[:tag_ids])
          @tweets = Tweet.joins(:tags).where(tags: { id: @tags.pluck(:id) }).distinct
        else
          @tweets = Tweet.all
        end
      end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @tweet = Tweet.find(params[:id])
      end
      def edit
        @tweet = Tweet.find(params[:id])
      end
      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end


      private
      def tweet_params
        params.require(:tweet).permit(:image,:name,:detail,:price,:link,tag_ids: [])
      end
    end