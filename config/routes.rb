Rails.application.routes.draw do

	root 'cocktails#index'

	resources :doses, only: :destroy
	resources :cocktails, only: [:index, :show, :new, :create] do
		resources :doses, only: [:create, :new]
	end

  mount Attachinary::Engine => "/attachinary"
end
