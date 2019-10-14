Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "blogs#index"
  resources :blogs,  only: [:index, :new , :destroy, :create, :delete, :edit, :update]
  resources :users, only: [:show]
  # get 'blogs/:id/edit' => 'blogs#update'
end
