class TweetsController < ApplicationController
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
  	end

  	def update
  		if @tweet.update(tweet_params)
  			redirect_to tweet_path, notice: "編集しました。"
  		end
  	end

  	def destroy
  		@tweet.destroy
  		redirect_to tweets_path, notice: "削除しました。"
  	end

 	def show
  	end

 	def confirm
 	end

 private 
  	def tweet_params
  		params.require(:tweet).permit(:content)
  	end

end