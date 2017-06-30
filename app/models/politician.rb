class Politician < ApplicationRecord
    
    
    def scraping
        @politicians = Politician.where(switch: "オン")
        puts "#{@politicians.count}"
        config = {
        	:consumer_key => 'HxTbIelBlbjp56cERilNt6XEy',
        	:consumer_secret => 'mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA',
        	:access_token => '732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4',
        	:access_token_secret => 'x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd'
        }
        
        @twClient = Twitter::REST::Client.new(config)
        
        @politicians.each do |politician|
            # word を含む tweet を 10 件取得する
            results = @twClient.search(politician.name, :count => 20, :result_type => "recent")
            results.take(20).each do |tweet|
                begin
                    @machine = Machine.new
                    @machine.tweet_id = tweet[:id]
                    @machine.politician = politician.name
                    @machine.name = "@" + tweet[:user][:screen_name]
                    @machine.text = tweet[:text]
                    @machine.save!
                rescue => e
                      p "エラー"
                end
            end
        end
        
    end
end
