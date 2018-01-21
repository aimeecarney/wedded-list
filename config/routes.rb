Rails.application.routes.draw do
  resources :comments
  resources :list_contacts
  resources :lists
  resources :contacts


  get '/lists/:id/add_contact', to: 'lists#add_contact'
  get '/lists/:id/add_new_contact', to: 'lists#add_new_contact'
  get '/lists/:id/local_contact', to: 'lists#local_contacts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # root 'welcome#home'
    authenticated do
      root :to => 'lists#index'
    end
    root :to => 'welcome#home'

    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
