class GamesController < ApplicationController
  def new
    range = [*'a'..'z']
    @letters = Array.new(10) { range.sample }
  end

  def matching
    @letters_array = params[:letters].split
    @word = params[:word].split
    @matching = @word.include? @letters_array
  end

  def valid
    @valid_word = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
  end

  def score
    matching
    valid
    if params[:word] != @matching
      @answer = "Sorry but #{params[:word]} can't be build out of #{@letters_array}!"
    elsif params[:word] != @valid_word
      @answer = "Sorry but #{params[:word]} doesn't seem to be an English word"
    else
      @answer = "CONGRATULATIONS! #{params[:word]} is a valid English word"
    end
  end
end
