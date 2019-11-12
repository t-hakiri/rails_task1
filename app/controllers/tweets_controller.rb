class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def toppage
  end

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
    if @tweet.save
      redirect_to tweets_path, notice: "tweetしました。"
    else
     render :new
    end
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "編集しました。"
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました。"
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  private 
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end