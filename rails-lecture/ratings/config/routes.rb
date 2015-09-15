Rails.application.routes.draw do
	resources :professors do
		# Rating routes will be nested inside Professor for index, new and create
		# /professors/:professor_id/ratings
		# /professors/:professor_id/ratings/new
		# /professors/:professor_id/ratings/create
		resources :ratings, shallow: true
	end

	root "professors#index"
end
