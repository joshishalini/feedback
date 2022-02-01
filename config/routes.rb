Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "questions#index"

  resources :questions, only: [:index] do
  	collection do 
  		get :all_questions
  		get :enabled_questions
  	end
  	member do
  		get :find_by_id
  	end
  end
end
