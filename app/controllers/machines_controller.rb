class MachinesController < ApplicationController
  require 'twitter'

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
    
    twClient = Twitter::REST::Client.new(config)
    
    word1 = "テロ" # 検索したいワード
    word2 = "ミャンマー" # 検索したいワード
    word_sum = word1 + word2

    # word を含む tweet を 10 件取得する
    results = twClient.search(word_sum, :count => 10, :result_type => "recent")

    results.attrs[:statuses].each do |tweet|
      @machine = Machine.new
      @machine.date = Time.parse(tweet[:created_at])
      @machine.tweet = tweet[:id]
      @machine.name = "@" + tweet[:user][:screen_name]
      @machine.text = tweet[:text]
      @machine.save!
    end
    
    @mashines = Machine.all

  end
end
