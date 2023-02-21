require 'open-uri'
require 'json'

class WordsController < ApplicationController
  def new
    @grid = []
    10.times { @grid << ("A".."Z").to_a.sample }
    @grid = @grid.join(" ");
    @grid
  end

  def score
    @word = params[:word]
    @grid = params[:grid]
    @score = 0
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @user_serialized = URI.open(@url).read
    @user = JSON.parse(@user_serialized)
    if @user["found"] == false
      @answer = "You get 0 points! It is no an english word"
    elsif include?(@word, @grid) == false
      @answer = "Word is not matching the grid. You do not get any points"
    else
      @answer = "Good job. You are getting #{@word.length} points"
      @score += @word.length
    end
    @answer
  end

  def include?(grid, attempt)
    attempt.upcase.scan(/\w/).map do |letter|
      return false unless grid.include?(letter)

      grid.delete_at(grid.index(letter))
    end
    true
  end
end
