class RatingsController < ApplicationController
	before_action :set_rating, only: [:edit, :update, :destroy]

	# GET /professors/:professor_id/ratings
	def index
		@professor = Professor.find(params[:professor_id])
		@ratings = Rating.all
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end	
end