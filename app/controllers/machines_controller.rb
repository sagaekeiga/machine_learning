class MachinesController < ApplicationController
  require 'twitter'

  def index
    @machines = Machine.all
  end
  
  def crawl
    config = {
    	:consumer_key => 'HxTbIelBlbjp56cERilNt6XEy',
    	:consumer_secret => 'mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA',
    	:access_token => '732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4',
    	:access_token_secret => 'x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd'
    }
    
    twClient = Twitter::REST::Client.new(config)
    
    word1 =  params[:word][:word1]
    word2 =  params[:word][:word2]
    word3 =  params[:word][:word3]
    word_sum = word1 + word2 + word3

    # word を含む tweet を 10 件取得する
    results = twClient.search(word_sum, :count => 100, :result_type => "recent", :include_entities => true)

    results.take(1000).each do |tweet|
      tweet.media.each do |media| #画像付きのツイート取得
        @machine = Machine.new
        @machine.tweet = tweet[:id]
        @machine.name = "@" + tweet[:user][:screen_name]
        @machine.text = tweet[:text]
        @machine.geo = tweet[:coordinates]
        @machine.url = media.media_url
        
        txt = "#{tweet[:text]}" ##　形態素解析
        
        natto = Natto::MeCab.new
        natto.parse(txt) do |n|
          if n.feature.include?("地域") ##　地域が含まれればインスタンスに追加
              puts @machine[:mecab] = "#{n.surface}: #{n.feature}"
          end
        end
        
        if !tweet[:coordinates].nil? || !@machine[:mecab].nil? #位置情報が付いていれば保存
          @machine.save!
        end
        
      end
    end
    
    @mashines = Machine.all

  end

end
