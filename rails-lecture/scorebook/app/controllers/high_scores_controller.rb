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
		if @high_score.save
			redirect_to @high_score, notice: "High score was successfully created."
		else
			render :new
		end
	end

	def edit
		@high_score = HighScore.find(params[:id])
	end

	def update
		@high_score = HighScore.find(params[:id])
		if @high_score.update(params.require(:high_score).permit(:user, :game, :score))
			redirect_to @high_score, notice: "High Score was successfully updated."
		else
			render :edit
		end
	end

	def destroy
		@high_score = HighScore.find(params[:id])
		@high_score.destroy
		redirect_to high_scores_path, notice: "High Score was successfully destroyed."
	end
end