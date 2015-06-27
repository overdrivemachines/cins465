class HighScoresController < ApplicationController
	def index
		@high_scores = HighScore.all
	end
end