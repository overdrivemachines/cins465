class HighScoresController < ApplicationController
	def index
		@high_scores = HighScore.all
	end
	def show
		@high_score = HighScore.find(params[:id])
	end
end