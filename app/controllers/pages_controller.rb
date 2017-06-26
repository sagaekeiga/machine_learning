class PagesController < ApplicationController
  def index
    @word = Word.new
    @mashines = Machine.all
  end
end
