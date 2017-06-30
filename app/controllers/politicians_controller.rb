class PoliticiansController < ApplicationController
    http_basic_authenticate_with name: "seijipress", password: "seijipress"


    def index
      @politicians = Politician.all
      @q        = Politician.search(params[:q])
      @results = @q.result(distinct: true)
    end
    
    def new
        @politician = Politician.new
    end
    
    def create
     @politician = Politician.new(politician_params)
     if @politician.save
       redirect_to root_path
     else
       render 'politicians/new'
     end
    end
    
    def edit
      @politician = Politician.find(params[:id])
    end
    
    def destroy
      @politician = Politician.find(params[:id])
        if @politician.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def show
      @politician = Politician.find(params[:id])
      @machines = Machine.where(politician: "#{@politician.name}")
    end
    
    def update
        @politician = Politician.find(params[:id])
        @politician.update(politician_params)
        redirect_to root_path
    end
    
    
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
                @machine = Machine.new
                @machine.politician = politician.name
                @machine.tweet = tweet[:id]
                @machine.name = "@" + tweet[:user][:screen_name]
                @machine.text = tweet[:text]
                @machine.save!
            end
        end
        
        redirect_to root_path
    end
    
      private
      
        def politician_params
          params.require(:politician).permit(:name, :age, :party, :occupation, :status, :vote, :election, :image, :switch)
        end
end
