require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)
    word = params[:word]
    @letters = params[:letters].split(' ')
    correct = word.upcase.chars.all? do |letter|
      valid = @letters.include?(letter)
      index = @letters.find_index(letter)
      @letters.delete_at(index) if index
      valid
    end
    if @user["found"] == true && correct
      @res = "Good, you have #{@user["length"]} points!"
    else
      @res = "Not this time bro.."
    end
    # num = end_time - start_time
    # num = 0
    #   hash_g = Hash.new(0)
    #   @letter.chars.each{ |letter| hash_g[letter] += 1 }
    #   hash_a = Hash.new(0)
    #   params[:word].upcase.chars.each{ |letter| hash_a[letter] += 1 }
    #   @results = {}
    #   if hash_a.all?{ |key, value| hash_g.key?(key) && value <= hash_g[key] }&& word["found"]
    #     @results[:score] = params[:word].split("").length + 100 - num
    #     @results[:message] = "well done!"
    #     @results[:time] = num
    #     p @results
    #     # return { score: params[:word].split("").length + 30 - num, message: "well done!", time: end_time - start_time }
    #   elsif word["found"] == false
    #     @results[:score] = 0
    #     @results[:message] = "not an english word"
    #     @results[:time] = num
    #     p @results
    #     # { score: 0, message: "word do not exist or you did not use corectly the letters", time: end_time - start_time }
    #   else
    #     @results[:score] = 0
    #     @results[:message] = "not in the grid"
    #     @results[:time] = num
    #     @results
    #   end
    # fetch(`https://wagon-dictionary.herokuapp.com/#{params[:word]}`)
    # .then((response) => response.json())
    # .then(data => {

    #   num = end_time - start_time
    #   hash_g = Hash.new(0)
    #   @letters.each{ |letter| hash_g[letter] += 1 }
    #   hash_a = Hash.new(0)
    #   params[:word].upcase.chars.each{ |letter| hash_a[letter] += 1 }
    #   @results = {}
    #   if hash_a.all?{ |key, value| hash_g.key?(key) && value <= hash_g[key] }&& word["found"]
    #     @results[:score] = params[:word].split("").length + 100 - num
    #     @results[:message] = "well done!"
    #     @results[:time] = num
    #     p @results
    #     # return { score: attempt.split("").length + 30 - num, message: "well done!", time: end_time - start_time }
    #   elsif word["found"] == false
    #     @results[:score] = 0
    #     @results[:message] = "not an english word"
    #     @results[:time] = num
    #     p @results
    #     # { score: 0, message: "word do not exist or you did not use corectly the letters", time: end_time - start_time }
    #   else
    #     @results[:score] = 0
    #     @results[:message] = "not in the grid"
    #     @results[:time] = num
    #     @results
    #   end
    # })
  end
end
