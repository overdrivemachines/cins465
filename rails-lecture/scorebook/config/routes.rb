Rails.application.routes.draw do
	# Create a new HighScore
	get 'high_scores/new', to: 'high_scores#new', as: 'new_high_score'

	# Edit an existing HighScore
	get 'high_scores/:id/edit', to: 'high_scores#edit', as: 'edit_high_score'

	# Show a single object
	get 'high_scores/:id', to: 'high_scores#show', as: 'high_score'
	
	# All HighScore objects
	get 'high_scores', to: 'high_scores#index', as: 'high_scores'

	# Object is created
	post 'high_scores', to: 'high_scores#create'

	# Object is updated
	patch 'high_scores/:id', to: 'high_scores#update'

	# Delete the object
	delete 'high_scores/:id', to: 'high_scores#destroy'

	root 'high_scores#index'
end
