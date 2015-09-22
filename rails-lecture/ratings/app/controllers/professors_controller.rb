class ProfessorsController < ApplicationController
	before_action :set_professor, only: [:show, :edit, :update, :destroy]

	def index
		@professors = Professor.all
	end

	def show
		@rating = @professor.ratings.new
	end

	def new
		@professor = Professor.new
		@professor.ratings.new
	end

	def edit
	end

	def create
		@professor = Professor.new(professor_params)
		if @professor.save
			redirect_to @professor, notice: 'Professor was successfully created.'
		else
			render :new
		end
	end

	def update
		if @professor.update(professor_params)
			redirect_to @professor, notice: 'Professor was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@professor.destroy
		redirect_to professors_url
	end

	private
		def set_professor
			@professor = Professor.find(params[:id])
		end

		def professor_params
			 params.require(:professor).permit(:first, :last, :university, ratings_attributes: [:course, :comment, :rating])
		end
end