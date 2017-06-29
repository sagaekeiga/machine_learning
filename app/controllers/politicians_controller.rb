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
    end
    
    def update
        @politician = Politician.find(params[:id])
        @politician.update(politician_params)
        redirect_to root_path
    end
    
      private
      
        def politician_params
          params.require(:politician).permit(:name, :age, :party, :occupation, :status, :vote, :election, :image)
        end
end
