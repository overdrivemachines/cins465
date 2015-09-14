class HighScoresController < ApplicationController
	before_action :set_high_score, only: [:show, :edit, :update, :destroy]

	def index
		@high_scores = HighScore.all
	end

	def show
		# set_high_score
		# @high_score = HighScore.find(params[:id])
	end

	def new
		@high_score = HighScore.new
	end

	def create
		@high_score = HighScore.new(high_score_params)
		if @high_score.save
			redirect_to @high_score, notice: "High score was successfully created."
		else
			render :new
		end
	end

	def edit
		# set_high_score
		# @high_score = HighScore.find(params[:id])
	end

	def update
		# set_high_score
		# @high_score = HighScore.find(params[:id])
		if @high_score.update(high_score_params)
			redirect_to @high_score, notice: "High Score was successfully updated."
		else
			render :edit
		end
	end

	def destroy
		# set_high_score
		# @high_score = HighScore.find(params[:id])
		@high_score.destroy
		redirect_to high_scores_path, notice: "High Score was successfully destroyed."
	end

	private
		def set_high_score
			@high_score = HighScore.find(params[:id])
		end

		# Extract the member variables from the params hash
		def high_score_params
			params.require(:high_score).permit(:user, :game, :score)
		end
end