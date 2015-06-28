class HighScoresController < ApplicationController
	def index
		@high_scores = HighScore.all
	end
	def show
		@high_score = HighScore.find(params[:id])
	end
	def new
		@high_score = HighScore.new
	end
	def create
		@high_score = HighScore.new(params.require(:high_score).permit(:user, :game, :score))
		if (@high_score.save)
			redirect_to @high_score, notice: 'High Score was successfully created'
		else
			render :new
		end
	end
end