load "#{Rails.root}/lib/ladder.rb"

class HomeController < ApplicationController
	def index
		dsize = dictionary.size
		@start_word = dictionary[rand(dsize)]
		@end_word = dictionary[rand(dsize)]
	end

	def result
		@words = Array.new
		@words[0] = params[:start_word]		
		@words[1] = params[:word1]
		@words[2] = params[:word2]
		@words[3] = params[:word3]
		@words[4] = params[:word4]
		@words[5] = params[:word5]
		@words[6] = params[:end_word]
		@words.delete_if { |word| word == "" }
	end
end