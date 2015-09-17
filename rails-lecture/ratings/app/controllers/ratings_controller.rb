class RatingsController < ApplicationController
	before_action :set_rating, only: [:edit, :update, :destroy]

	# GET /professors/:professor_id/ratings/new
	def new
		@professor = Professor.find(params[:professor_id])
		@rating = @professor.ratings.new
	end

	# GET /ratings/1/edit
	# set_ratings called
	def edit
	end

	# POST /professors/:professor_id/ratings
	def create
		@professor = Professor.find(params[:professor_id])
		@rating = @professor.ratings.new(rating_params)
		if @rating.save
			redirect_to professor_url(@professor), notice: 'Rating was successfully created.'
		else
			render :new
		end
	end

	# PUT/PATCH /ratings/1
	# set_ratings called
	def update
		if @ratings.update(rating_params)
			redirect_to professor_url(@rating.professor), notice: 'Rating was successfully updated.'
		else
			render :edit
		end
	end

	# DELETE /ratings/1
	# set_ratings called
	def destroy
		@rating.destroy
		redirect_to professor_url(@rating.professor), notice: 'Rating was successfully destroyed.'
	end

	private
		def set_rating
			@rating = Rating.find(params[:id])
		end

		def rating_params
			params.require(:rating).permit(:course, :comment, :rating)
		end
end