load "#{Rails.root}/lib/ladder.rb"

class HomeController < ApplicationController
	def index
		dsize = dictionary.size
		@start_word = dictionary[rand(dsize)]
		@end_word = dictionary[rand(dsize)]
	end

	def result
		start_word = params[:start_word]
		end_word = params[:end_word]
		word1 = params[:word1]
		word2 = params[:word2]
		word3 = params[:word3]
		word4 = params[:word4]
		word5 = params[:word5]

		@res = false
		if (edit_distance_of_one(start_word, word1))
			@res = true
		else
			@res = false
		end
	end
end