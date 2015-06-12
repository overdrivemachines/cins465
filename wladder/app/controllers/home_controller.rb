load "#{Rails.root}/lib/ladder.rb"

class HomeController < ApplicationController
	def index
		dsize = dictionary.size
		@start_word = dictionary[rand(dsize)]
		@end_word = dictionary[rand(dsize)]
	end

	def result
	end
end