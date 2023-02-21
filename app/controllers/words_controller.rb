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
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @user_serialized = URI.open(@url).read
    @user = JSON.parse(@user_serialized)
    end
  end
