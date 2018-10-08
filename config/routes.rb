Rails.application.routes.draw do
  get 'competitions',to:'competitions#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	devise_for :users
	root 'routes#root'
	resources :exams,except:[:show,:index]
	get 'practise/:id', to: 'exams#show', as: 'practise'
	get 'practise', to: 'exams#index'
	resources :scores
	get '/dashboard',to: 'welcomes#index'
	get '/performance', to: 'scores#index'
	resources :competitions
	get 'increase_i', to: 'competitions#increase_i'
	get 'time_finished', to: 'competitions#time_finished'
end
