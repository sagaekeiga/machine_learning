class TwittersController < ApplicationController
  
  def index
  end


  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end
  
  def crawl
    config = {
    	:consumer_key => 'HxTbIelBlbjp56cERilNt6XEy',
    	:consumer_secret => 'mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA',
    	:access_token => '732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4',
    	:access_token_secret => 'x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd'
    }
    
    client = Twitter::REST::Client.new(config)
    
    @tweets = []
    client.user_timeline('dkfj').each {|tweet|
    	# Tweet時間
    	puts tweet.created_at
    
    	# Tweet本文
    	@tweets = tweet.text
    
    	# Retweet数
    	puts "Retweetされた数 : " + tweet.retweet_count.to_s
    
    	# お気に入りされた数
    	puts "お気に入りされた数 : " + tweet.favorite_count.to_s
    
    	# 位置情報
    	puts "位置情報 : " + tweet.geo if !tweet.geo.nil?
    }
  end
end
