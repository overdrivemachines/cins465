class ProfessorsController < ApplicationController
	before_action :set_professor, only: [:show, :edit, :update, :destroy]

	def index
		@professors = Professor.all
	end

	def show
	end

	def new
		@professor = Professor.new
	end

	def edit
	end

	def create
		@professor = Professor.new(professor_params)
	end

	def update
	end

	def destroy
	end

	private
		def set_professor
			@professor = Professor.find(params[:id])
		end

		def professor_params
			 params.require(:professor).permit(:first, :last, :university)
		end
end