require 'open-uri'

class GamesController < ApplicationController
  def new
    @start = Date.new
    @grid = []
    10.times { @grid << [*('a'..'z')].sample }
  end

  def score
    @grid = params[:grid]
    @answer = params[:answer]
    raise
    @result = call_le_wagon(@answer)
    @start_time = params[:time]
    @time = Time.now.to_i - @start_time.to_i



  end

  private

  def call_le_wagon(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    JSON.parse(open(url).read)
  end


end
