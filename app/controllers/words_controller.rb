class WordsController < ApplicationController
  
  def create
     @word = Word.new(word_params)
     if @word.save!
       redirect_to root_path
     else
     end
  end
  
  def update
    @word = Word.find(params[:id])
    @word.update(word_params)
    redirect_to @word
  end
  
  def destroy
    @word = Word.find(params[:id])
    if @word.delete
     flash[:success] = "deleted"
    end
    redirect_to root_path
  end
  
      private
      
        def word_params
          params.require(:word).permit(:word1, :word2, :word3)
        end
end
