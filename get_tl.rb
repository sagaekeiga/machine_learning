require 'twitter'

twClient = Twitter::REST::Client.new do |config|
  config.consumer_key    = 'HxTbIelBlbjp56cERilNt6XEy'
  config.consumer_secret = 'mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA'
  config.access_token    = '732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4'
  config.access_token_secret = 'x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd'
end



word = "update_name" # 検索したいワード

# word を含む tweet を 10 件取得する
results = twClient.search(word, :count => 10, :result_type => "recent")

results.attrs[:statuses].each do |tweet|
  puts Time.parse(tweet[:created_at])
  puts tweet[:id]
  puts "@" + tweet[:user][:screen_name]
  puts tweet[:text]
  puts
end